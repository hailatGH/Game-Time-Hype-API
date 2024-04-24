const { Sequelize, Op } = require("sequelize");
const db = require("../../models");
const validation = require("../../validation");

exports.create = (req, res) => {
    (req.body.thumbnail = req.files.thumbnail[0].filename),
      (req.body.item = req.files.item[0].filename),
    db.audioTracks
      .create({
        ...req.body,
        userId: req.token.id,
      })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "record has been added to the DB.",
        });
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "some error occured while inserting record.",
        });
      });
};

exports.getAll = (req, res) => {
  let page = req.params.page;
  if(req.body.categoryId == 1 || req.body.categoryId == 2 || req.body.categoryId == 3){
    db.audioTracks
    .findAll({
      attributes: { exclude: ["userId"] },
      where:{category:req.body.categoryId},
      order: [["createdAt", "DESC"]],
      limit: 15,
      offset: page * 15,
    })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "record has been successfully fetched",
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while inserting record.",
      });
    });
  }else{
    res.status(400).send({
      success:false,
      message:"Please provide valid categoryId in body."
    })
  }
};

exports.getByName = (req, res) => {
  if(req.body.categoryId < 1 || req.body.categoryId > 3){
    return res.status(400).send({
      success:false,
      message:"please pass valid categoryId in the body"
    })
  }
  if(req.body.name){
    if (req.body.searchByname) {
        db.audioTracks
          .findAll({
              where: { name: { [Op.iLike]: `%${req.body.name.toLowerCase()}%` },category:req.body.categoryId },
          })
          .then((data) => {
            res.status(200).send({
              success: true,
              message: "record has been successfully fetched.",
              data,
            });
          }).catch(err => {
            res.status(400).send({
                success:false,
                message:"some error occured while fetching data from DB."
            })
          })
      }else{
        db.audioTracks
          .findAll({
            where: { artist: { [Op.iLike]: `%${req.body.name.toLowerCase()}%` },category:req.body.categoryId},
          })
          .then((data) => {
            res.status(200).send({
              success: true,
              message: "record has been successfully fetched.",
              data,
            });
          }).catch(err => {
            res.status(400).send({
                success:false,
                message:"some error occured while fetching data from DB."
            })
          })
      }
  }else{
    res.status(400).send({
        success:false,
        message:"please pass valid name in body"
    })
  }
};

exports.getAllAdmin = (req, res) => {
  let { page, limit } = req.query;
    db.audioTracks
    .findAll({
      attributes: { exclude: ["userId"] },
      order: [["createdAt", "DESC"]],
      limit: limit,
      offset: page * limit,
    })
    .then(async(data) => {
      let count =await db.sequelize.query(`select count(*)as count from "audioTracks"`,{QueryTypes:"SELECT"})
      count = parseInt(count[0][0].count);
      res.status(200).send({
        success: true,
        message: "record has been successfully fetched",
        count,
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while inserting record.",
      });
    });
};