const { Sequelize, Op } = require("sequelize");
const db = require("../../models");

exports.create = (req, res) => {
  if (req.body.name) {
    db.playlists
      .create({ ...req.body, userId: req.token.id })
      .then((data) => {
        if (data) {
          res.status(200).send({
            success: true,
            message: "Playlist has been created successfully.",
            data,
          });
        } else {
          res.status(400).send({
            success: false,
            message: "some error occured while creating playlist",
          });
        }
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "some error has been occured while creating playlist",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid name of the playlist",
    });
  }
};

exports.getAll = (req, res) => {
  db.playlists
    .findAll({ where: { userId: req.token.id } })
    .then((data) => {
      if (data.length) {
        res.status(200).send({
          success: true,
          message: "Playlist has been fetched successfully.",
          data,
        });
      } else {
        res.status(200).send({
          success: true,
          message: "No playlist Found with your Account",
          data: [],
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching playlists.",
      });
    });
};

exports.delete = (req, res) => {
  if (req.query.playlistId) {
    db.playlists
      .findOne({ where: { id: req.query.playlistId } })
      .then(async (data) => {
        if (data) {
          if (data.dataValues.userId === req.token.id) {
            const bucket = req.firebase.storage().bucket();
            await bucket
              .deleteFiles({
                prefix: `Files/${req.token.id}/Music/${data.dataValues.id}`,
              })
              .then(async (data) => {
                db.songs.destroy({where:{playlistId:req.query.playlistId}})
                db.playlists.destroy({where:{id:req.query.playlistId}})
                res.status(200).send({
                  success:true,
                  message:"Playlist has been deleted successfully."
                })
              }).catch(err=>{
                return res.status(400).send({
                  success:false,
                  message:"some error has been occured while deleting playlist from firestorage"
                })
              })
          } else {
            return res.status(400).send({
              success: false,
              message: "You are not authorized to delete this playlist.",
            });
          }
        } else {
          return res.status(400).send({
            success: false,
            message: "playlist not found in db.",
          });
        }
      })
      .catch((err) => {
        console.log(err);
        return res.status(400).send({
          success: false,
          message: "some error has been occured while deleting playlist.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "provide valid playlistId in query params",
    });
  }
};
