const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");
const fs = require("fs");
const removeFile = require("./removeFile");
const path = require("path");
const mt = require("media-thumbnail");

db.teams.hasMany(db.matchVideo);
db.matchVideo.belongsTo(db.teams);

exports.insertData = (req, res) => {
  if (req.file) {
    req.body.videoId = req.file.filename;
  }
  let tempFileName = req.body.videoId.split(".")[0];
  tempFileName = tempFileName + ".png";
  let videoPath = path.join(__dirname, "../../uploads/") + req.body.videoId;
  let imagePath = path.join(__dirname, "../../uploads/") + tempFileName;
  mt.forVideo(
    videoPath,
    imagePath,
    {
      width: 250,
      height: 250,
    },
    "video"
  ).then(() => {
    db.matchVideo
      .create({
        videoId: req.body.videoId,
        thumbnailId: tempFileName,
        title: req.body.title,
        creatorId: req.token.id,
        teamId: req.body.teamId,
        date: new Date(req.body.date),
      })
      .then((data) => {
        if (data) {
          res.status(200).send({
            success: true,
            message: "Record has been inserted successfully.",
            data,
          });
        } else {
          res.status(400).send({
            success: false,
            message: "some error occured while inserting record.",
          });
        }
      })
      .catch((err) => {
        console.log(err);
        res.status(400).send({
          success: false,
          message: "some error has been occured while inserting record.",
        });
      });
  });
};

exports.getAllData = (req, res) => {
  db.matchVideo
    .findAll({ order: [["date", "DESC"]] })
    .then((data) => {
      if (data) {
        res.status(200).send({
          success: true,
          message: "Record has been fetched successfully.",
          data,
        });
      } else {
        res.status(400).send({
          success: false,
          message: "some error occured while fetching record.",
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while inserting record.",
      });
    });
};

exports.getAllVideoByDate = async (req, res) => {
  try {
    let userTeams = await db.userTeams.findOne({
      where: { userId: req.token.id },
      attributes: ["teams"],
    });
    if (userTeams) {
      userTeams = Object.keys(userTeams.dataValues.teams);
      db.matchVideo
        .findAll({
          where: { teamId: userTeams, date: new Date(req.body.date) },
          include: [
            { model: db.teams, attributes: ["id", "teamProfile", "name"] },
          ],
          order:[["createdAt","DESC"]]
        })
        .then((data) => {
          res.status(200).send({
            success: true,
            message: "matchVideo has been fetched successfully.",
            data,
          });
        })
        .catch((err) => {
          console.log(err);
          res.status(400).send({
            success: false,
            message: "some error has been occured while fetching match video.",
          });
        });
    } else {
      res.status(400).send({
        success: false,
        message: "No teams Found on your account.",
      });
    }
  } catch (error) {
    res.status(400).send({
      success: false,
      message: "some error has been occured while fetching group.",
    });
  }
};
