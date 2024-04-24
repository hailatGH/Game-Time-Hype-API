const { Op, where } = require("sequelize");
const db = require("../../models");
const validation = require("../../validation");
const mt = require("media-thumbnail");
const path = require("path");
const removeFile = require("./removeFile");

exports.create = (req, res) => {
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
    db.challenges
      .create({
        ...req.body,
        thumbnailId: tempFileName,
        userId: req.token.id,
      })
      .then(async (data) => {
        if (!data) {
          res.status(400).send({
            success: false,
            message: "some error occured while creating the Record",
          });
        } else {
          if ("challengeId" in req.body && req.body.challengeId) {
            let acceptedCounter = await db.challenges.findOne({
              where: { id: req.body.challengeId },
              attributes: ["acceptedCounter", "limit"],
            });
            if (
              acceptedCounter?.dataValues?.acceptedCounter <
                acceptedCounter?.dataValues?.limit ||
              acceptedCounter.dataValues.limit === 0
            ) {
              db.challenges.increment("acceptedCounter", {
                by: 1,
                where: { id: req.body.challengeId },
              });
            } else {
              removeFile(data.dataValues.videoId);
              removeFile(data.dataValues.thumbnailId);
              await db.challenges.destroy({
                where: { id: data.dataValues.id },
              });
              return res.status(400).send({
                success: false,
                message: "Accept challenge limit has exceed.",
              });
            }
          }
          res.status(200).send({
            success: true,
            message: "Record has been created successfully",
            data,
          });
        }
      })
      .catch((err) => {
        validation(err, res);
      }),
      (err) => console.error(err);
  });
};

exports.getAll = (req, res) => {
  db.challenges.hasMany(db.challenges);
  db.challenges.belongsTo(db.challenges);
  let { page, limit } = req.query;
  db.challenges
    .findAll({
      order: [["createdAt", "DESC"]],
      include: [
        {
          model: db.users,
          include: [
            {
              required: false,
              model: db.blocklist,
              where: { blockedUserId: req.token.id },
            },
          ],
          "$blocklists.blockedUserId$": null,
          attributes: ["id", "fullname", "profileImagePath", "university"],
        },
        {
          model: db.challenges,
          as: "challenge",
        },
      ],
      limit: limit,
      offset: page * limit,
    })
    .then(async (data) => {
      const likes = await db.challengesLikes.findOne({
        where: { userId: req.token.id },
      });
      for (let i = 0; i < data.length; i++) {
        if (likes && likes.dataValues.items.hasOwnProperty(data[i].videoId))
          data[i].dataValues.hasLike = true;
        else data[i].dataValues.hasLike = false;
        await db.challenges
          .findOne({ where: { challengeId: data[i].id, userId: req.token.id } })
          .then((y) => {
            if (y) data[i].dataValues.hasAccepted = true;
            else data[i].dataValues.hasAccepted = false;
          });
      }
      await res.status(200).send({
        success: true,
        message: "challenges has been successfully fetched",
        data: data,
      });
    })
    .catch((err) => {
      console.log(err)
      res.status(400).send({
        success: false,
        message: "some error occurred while fetching records",
      });
    });
};

exports.like = (req, res) => {
  let videoId = req.body.videoId;
  let clipId = req.body.id;
  db.challengesLikes
    .findOrCreate({ where: { userId: req.token.id } })
    .then((data) => {
      if (data) {
        db.challenges.increment("like", { by: 1, where: { id: req.body.id } });
        let source = data[0].dataValues.items;
        const target = {
          [videoId]: clipId,
        };
        const obj = Object.assign(target, source);
        db.challengesLikes
          .update({ items: obj }, { where: { userId: req.token.id } })
          .then((data) => {
            res.status(200).send({
              success: true,
              message: "Like has been done",
            });
          });
      }
    });
};

exports.removeLike = (req, res) => {
  db.challengesLikes
    .findOne({ where: { userId: req.token.id } })
    .then(async (data) => {
      if (!data) {
        res.status(400).send({
          success: false,
          message: "You haven't like Any Video.",
        });
      } else {
        let clips = new Object();
        clips = data.items;
        let removeClips = req.body.deletedItem;
        delete clips[removeClips];
        db.challenges
          .findOne({ where: { videoId: removeClips } })
          .then(async (data) => {
            let counter = data.dataValues.like;
            if (counter > 0)
              db.challenges.decrement("like", {
                by: 1,
                where: { videoId: removeClips },
              });
          });
        await db.challengesLikes
          .update({ items: clips }, { where: { userId: req.token.id } })
          .then((data) => {
            if (!data) {
              res.status(400).send({
                success: false,
                message: "some error occured while removing Like.",
              });
            } else {
              res.status(200).send({
                success: true,
                message: "Unlike operation has been Done.",
              });
            }
          });
      }
    });
};

exports.myChallenge = (req, res) => {
  let page = req.params.page;
  db.challenges
    .findAll({
      include:[
        {
          model: db.users,
          attributes: ["id", "fullname", "profileImagePath", "university"],
        }
      ],
      attributes: { exclude: ["userId"] },
      where: { userId: req.token.id, challengeId: null },
      order: [["createdAt", "DESC"]],
      limit: 30,
      offset: page * 30,
    })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "your challenges has been fetched successfully",
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while fetching your challenges",
      });
    });
};

exports.acceptedChallenge = (req, res) => {
  let page = req.params.page;
  db.challenges
    .findAll({
      include:[
        {
          model: db.users,
          attributes: ["id", "fullname", "profileImagePath", "university"],
        }
      ],
      attributes: { exclude: ["userId"] },
      where: { challengeId: { [Op.ne]: null }, userId: req.token.id },
      order: [["createdAt", "DESC"]],
      limit: 30,
      offset: page * 30,
    })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "your challenges has been fetched successfully",
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while fetching your challenges",
      });
    });
};

exports.update = (req,res) =>{
  if(req.query.id){
    db.challenges.update({...req.body},{where:{id:req.query.id}}).then(data=>{
      res.status(200).send({
        success:true,
        message:"challenge has been updated successfully."
      })
    }).catch(err=>{
      res.status(400).send({
        success:false,
        message:"some error has been occured while updating challenge."
      })
    })
  }else{
    res.status(400).send({
      success:false,
      message:"provide valid id in the query"
    })
  }
}

exports.deleteChallenge = (req, res) => {
  let { challengeId } = req.query;
  if (challengeId) {
    db.challenges.findOne({ where: { id: challengeId } }).then(async(data) => {
      if (data) {
        let adminId = await db.users.findOne({where:{id:req.token.id},attributes:['roleId']}) 
        if(data.dataValues.userId == req.token.id || adminId.dataValues.roleId==4 || adminId.dataValues.roleId==5){
        if (data.dataValues.challengeId) {
          db.sequelize.query(
            `update challenges SET "acceptedCounter"="acceptedCounter"-1 where "id"='${data.dataValues.challengeId}' and "acceptedCounter">0`,
            { QueryTypes: "UPDATE" }
          );
          removeFile(data.dataValues.videoId);
          removeFile(data.dataValues.thumbnailId);
          db.challenges
            .destroy({ where: { id: challengeId } })
            .then((data) => {
              res.status(200).send({
                success: true,
                message: "Challenge has been deleted successfully.",
              });
            })
            .catch((err) => {
              res.status(400).send({
                success: false,
                message: "Some error has been occured while deleting records.",
              });
            });
        } else {
          removeFile(data.dataValues.videoId);
          removeFile(data.dataValues.thumbnailId);
          db.challenges
            .findAll({ 
              where: { challengeId: data.dataValues.id },
              attributes:['videoId','thumbnailId']
             })
            .then(async(data) => {
              data.map(x=>{
                removeFile(x.dataValues.videoId)
                removeFile(x.dataValues.thumbnailId)
              })
              db.challenges
            .destroy({ where: { id: challengeId } })
            .then((data) => {
              res.status(200).send({
                success: true,
                message: "Challenge has been deleted successfully.",
              });
            })
            .catch((err) => {
              res.status(400).send({
                success: false,
                message: "Some error has been occured while deleting records.",
              });
            });
            })
            .catch((err) => {
              console.log(err);
            });
        }
        }else{
          res.status(400).send({
            success:false,
            message:"You are not authorized to delete this challenge."
          })
        }
      } else {
        res.status(200).send({
          success: false,
          message: "Challenge Not found in Database.",
        });
      }
    });
  } else {
    res.status(400).send({
      success: false,
      message: "provide valid challengeId in params.",
    });
  }
};
