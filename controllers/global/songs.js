const db = require("../../models");

exports.create = (req, res) => {
  if (req.body.name && req.body.url && req.body.playlistId) {
    db.songs
      .create({ ...req.body, userId: req.token.id })
      .then((data) => {
        if (data) {
          db.playlists
            .findOne({ where: { id: req.body.playlistId } })
            .then((data1) => {
              let Obj = {
                ...data1.dataValues.items,
                [data.dataValues.id]: data.dataValues.id,
              };
              db.playlists.update(
                { items: Obj },
                { where: { id: req.body.playlistId } }
              );
            })
            .catch((err) => {
              return res.status(400).send({
                success: false,
                message:
                  "Some error occured while inserting record in playlist",
              });
            });
          res.status(200).send({
            success: true,
            message: "song has been added to playlist successfully.",
            data,
          });
        } else {
          res.status(400).send({
            success: false,
            message: "some error occured while adding song in playlist",
          });
        }
      })
      .catch((err) => {
        console.log(err);
        res.status(400).send({
          success: false,
          message: "some error has been occured while adding song in playlist",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid name of the playlist",
    });
  }
};

exports.getById = (req, res) => {
  let { page, limit, playlistId } = req.query;
  db.songs
    .findAll({
      where: { playlistId },
      limit: limit,
      offset: page * limit,
      order: [["createdAt", "Desc"]],
    })
    .then((data) => {
      if (data) {
        res.status(200).send({
          success: true,
          message: "Songs has been fetched successfully.",
          data,
        });
      } else {
        res.status(200).send({
          success: true,
          message: "No songs found.",
          data: [],
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching songs.",
      });
    });
};

exports.deleteSong = async (req, res) => {
  let playlistId = req.body.playlistId, songName,songId;
  db.songs
    .findOne({ where: { id: req.body.songId } })
    .then(async (data) => {
      if (data) {
        songName = data.dataValues.name;
        songId = data.dataValues.id;
        const bucket = req.firebase.storage().bucket();
        await bucket
          .deleteFiles({
            prefix: `Files/${req.token.id}/Music/${playlistId}/${songName}`,
          })
          .then(async(data) => {
            await db.songs.destroy({where:{id:songId}})
            await db.playlists.findOne({where:{id:playlistId}}).then(data1=>{
                let Obj = data1.dataValues.items;
                delete Obj[songId];
             db.playlists.update({items:Obj},{where:{id:playlistId}}).then(data=>{
                res.status(200).send({
                    success:true,
                    message:"Song has been successfully deleted."
                })
             })
            })
          })
          .catch((err) => {
            return res.status(400).send({
                success: false,
                message: "some error has been occured while deleting record from firestorage.",
              });
          });
      } else {
        return res.status(400).send({
          success: false,
          message: "Songs not found in the DB.",
        });
      }
    })
    .catch((err) => {
      return res.status(400).send({
        success: false,
        message: "some error has been occured while fetching record from DB.",
      });
    });
};

