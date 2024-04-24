const { Op } = require("sequelize");
const db = require("../../models");
const validation = require("../../validation");
const path = require("path");
const fs = require("fs");
const removeFile = require("./removeFile");
exports.create = (req, res) => {
  if (req.files) {
    let tempFileName = req.files.videoId[0].filename.split(".")[0];
    tempFileName =
      tempFileName + "." + req.files.thumbnail[0].filename.split(".")[1];
    let oldimagePath =
      path.join(__dirname, "../../uploads/") + req.files.thumbnail[0].filename;
    let newimagePath = path.join(__dirname, "../../uploads/") + tempFileName;

    fs.rename(oldimagePath, newimagePath, function (err) {
      if (err) {
      }
    });
    db.motivationalClips
      .create({
        title: req.body.title,
        videoId: req.files.videoId[0].filename,
        thumbnailId: tempFileName,
        userId: req.token.id,
      })
      .then((data) => {
        if (data) {
          res.status(200).send({
            success: true,
            message: "Record has been inserted successfully.",
            data,
          });
        }
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "some error has been occured while fetching data.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid thumbnail,videoId",
    });
  }
};
exports.update = async (req, res) => {
  let previousMotivationalClips = await db.motivationalClips.findOne({
    where: { id: req.params.id },
  });
  console.log(req.files);
  let oldimagePath;
  let newimagePath;
  if (Object.keys(req.files).length) {
    if (
      req.files.videoId &&
      req.files.videoId.length &&
      req.files.thumbnail &&
      req.files.thumbnail.length
    ) {
      let tempFileName = req.files.videoId[0].filename.split(".")[0];

      tempFileName =
        tempFileName + "." + req.files.thumbnail[0].filename.split(".")[1];
      oldimagePath =
        path.join(__dirname, "../../uploads/") +
        req.files.thumbnail[0].filename;
      newimagePath = path.join(__dirname, "../../uploads/") + tempFileName;
      req.body.videoId = req.files.videoId[0].filename;
      req.body.thumbnailId = tempFileName;
    } else if (req.files.videoId && req.files.videoId.length) {
      let tempFileName = req.files.videoId[0].filename.split(".")[0];
      tempFileName =
        tempFileName +
        "." +
        previousMotivationalClips.dataValues.thumbnailId.split(".")[1];
      oldimagePath =
        path.join(__dirname, "../../uploads/") +
        previousMotivationalClips.dataValues.thumbnailId;
      newimagePath = path.join(__dirname, "../../uploads/") + tempFileName;

      req.body.videoId = req.files.videoId[0].filename;
      req.body.thumbnailId = tempFileName;
    } else if (req.files.thumbnail && req.files.thumbnail.length) {
      let tempFileName = req.files.thumbnail[0].filename.split(".")[0];
      tempFileName =
        tempFileName +
        "." +
        previousMotivationalClips.dataValues.videoId.split(".")[1];
      oldimagePath =
        path.join(__dirname, "../../uploads/") +
        previousMotivationalClips.dataValues.videoId;
      newimagePath = path.join(__dirname, "../../uploads/") + tempFileName;
      req.body.thumbnailId = req.files.thumbnail[0].filename;
      req.body.videoId = tempFileName;
    }
  }

  db.motivationalClips
    .update(
      { ...req.body, userId: req.token.id },
      { where: { id: req.params.id } }
    )
    .then((data) => {
      if (data) {
        if (Object.keys(req.files).length) {
          if (
            req.files.videoId &&
            req.files.videoId.length &&
            req.files.thumbnail &&
            req.files.thumbnail.length
          ) {
            removeFile(previousMotivationalClips.dataValues.videoId);
            removeFile(previousMotivationalClips.dataValues.thumbnailId);
            fs.rename(oldimagePath, newimagePath, function (err) {
              if (err) {
              }
            });
          } else if (req.files.videoId && req.files.videoId.length) {
            fs.rename(oldimagePath, newimagePath, function (err) {
              if (err) {
              }
            });
            removeFile(previousMotivationalClips.dataValues.videoId);
          } else if (req.files.thumbnail && req.files.thumbnail.length) {
            fs.rename(oldimagePath, newimagePath, function (err) {
              if (err) {
              }
            });
            removeFile(previousMotivationalClips.dataValues.thumbnailId);
          }
        }
        res.status(200).send({
          success: true,
          message: "Record has been updated successfully.",
          data,
        });
      }
    })
    .catch((err) => {
      if (Object.keys(req.files).length) {
        if (
          req.files.videoId &&
          req.files.videoId.length &&
          req.files.thumbnail &&
          req.files.thumbnail.length
        ) {
          removeFile(req.files.videoId[0].filename);
          removeFile(req.files.thumbnail[0].filename);
        } else if (req.files.videoId && req.files.videoId.length) {
          removeFile(req.files.videoId[0].filename);
        } else if (req.files.thumbnail && req.files.thumbnail.length) {
          removeFile(req.files.thumbnail[0].filename);
        }
      }

      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching data.",
      });
    });
};
exports.delete = async (req, res) => {
  let previousMotivationalClips = await db.motivationalClips.findOne({
    where: { id: req.params.id },
  });
  removeFile(previousMotivationalClips.dataValues.videoId);
  removeFile(previousMotivationalClips.dataValues.thumbnailId);

  db.motivationalClips
    .destroy({ where: { id: req.params.id } })
    .then((data) => {
      if (data) {
        res.status(200).send({
          success: true,
          message: "Record has been Deleted successfully.",
          data,
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching data.",
      });
    });
};

exports.getAll = (req, res) => {
  let { page, limit } = req.query;
  db.motivationalClips
    .findAll({
      attributes: { exclude: ["userId"] },
      order: [["createdAt", "DESC"]],
      limit: limit,
      offset: page * limit,
    })
    .then(async (data) => {
      const likes = await db.motivationalClipsLikes.findOne({
        where: { userId: req.token.id },
      });
      data = data.map((x) => {
        if (likes && likes.dataValues.items.hasOwnProperty(x.id))
          x.dataValues.hasLike = true;
        else x.dataValues.hasLike = false;
        return x;
      });
      let count = await db.sequelize.query(
        `select count(*)as count from "motivationalClips"`,
        { QueryTypes: "SELECT" }
      );
      count = parseInt(count[0][0].count);
      res.status(200).send({
        success: true,
        message: "motivational clips has been successfully fetched",
        count,
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while fetching records",
      });
    });
};

exports.like = (req, res) => {
  let videoId = req.body.videoId;
  let clipId = req.body.id;
  let thumnailId = req.body.thumbnail;
  db.motivationalClipsLikes
    .findOrCreate({ where: { userId: req.token.id } })
    .then((data) => {
      if (data) {
        let source = data[0].dataValues.items;
        const target = {
          [clipId]: [thumnailId, videoId],
        };
        const obj = Object.assign(target, source);
        db.motivationalClipsLikes
          .update({ items: obj }, { where: { userId: req.token.id } })
          .then((data) => {
            db.motivationalClips.increment("likeCount", {
              by: 1,
              where: { id: clipId },
            });
            res.status(200).send({
              success: true,
              message: "Like has been done",
            });
          });
      }
    });
};

exports.removeLike = (req, res) => {
  db.motivationalClipsLikes
    .findOne({ where: { userId: req.token.id } })
    .then(async (data) => {
      if (!data) {
        res.status(400).send({
          success: false,
          message: "Please pass valid id in body",
        });
      } else {
        let clips = new Object();
        clips = data.items;
        let removeClips = req.body.deletedItem;
        delete clips[removeClips];
        await db.motivationalClipsLikes
          .update({ items: clips }, { where: { userId: req.token.id } })
          .then((data) => {
            if (!data) {
              res.status(400).send({
                success: false,
                message: "some error occured while removing Like.",
              });
            } else {
              db.motivationalClips
                .findOne({ where: { id: removeClips } })
                .then((data) => {
                  let counter = data.dataValues.likeCount;
                  if (counter > 0)
                    db.motivationalClips.decrement("likeCount", {
                      by: 1,
                      where: { id: removeClips },
                    });
                  res.status(200).send({
                    success: true,
                    message: "Unlike operation has been Done.",
                  });
                })
                .catch((err) => {});
            }
          });
      }
    });
};

exports.findOneLatest = (req, res) => {
  db.motivationalClips
    .findOne({
      order: [["createdAt", "Desc"]],
    })
    .then(async (data) => {
      res.status(200).send({
        success: true,
        message: "Notes has been successfully fetched",
        data,
      });
    })
    .catch((err) => {
      validate(err, res);
      console.error(err);
      res.status(400).send({
        success: false,
        message: "some error has been occurred while fetching notes",
      });
    });
};

exports.getlikedClips = (req, res) => {
  db.motivationalClipsLikes
    .findAll({ where: { userId: req.token.id } })
    .then((data) => {
      if (!data) {
        res.status(400).send({
          success: false,
          message: "No Record found",
        });
      } else {
        res.status(200).send({
          success: true,
          message: "Records has been successfully fetched from DB",
          data: data[0] ? data[0].dataValues.items : null,
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while fetching records from DB.",
      });
    });
};
