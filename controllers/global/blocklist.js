const db = require("../../models");
const validate = require("../../validation");

exports.findAll = async (req, res) => {
  db.blocklist
    .findAll({
      limit: 15,
      offset: parseInt(req.params.page) * 15,
      include: [
        {
          model: db.users,
          as: "blockedUser",
          attributes: ["id", "fullname", "profileImagePath", "university"],
        },
      ],
      where: { userId: req.token.id },
      attributes: { exclude: ["createdAt", "updatedAt", "userId"] },
    })
    .then((data) => {
      res.send({
        statusCode: 200,
        success: true,
        message: "find all blocklist successfully",
        data: data,
      });
    })
    .catch((err) => {
      res.status(500).send({
        message:
          err.message || "some error occurred while retrieving blocklist",
      });
    });
};

exports.create = (req, res) => {
  let userId = req.token.id;
  db.blocklist
    .findOrCreate({
      where: {
        userId: userId,
        blockedUserId: req.body.blockedUserId,
      },
      defaults: req.body,
    })
    .then(async (data) => {
      if (!data[1])
        res.status(409).send({
          statusCode: 409,
          success: false,
          message: "you already blocked this user",
        });
      else {
        let community = await db.community.findOne({
          where: { userId: req.token.id },
        });
        if (community) {
          let newObj = community.dataValues.friendId;
          if (newObj) delete newObj[req.body.blockedUserId];
          await db.community.update(
            { friendId: newObj },
            { where: { userId: req.token.id } }
          );
          const challenges = await db.challenges.findAll({
            attributes: ["userId", "videoId"],
            where: { userId: req.token.id },
          });
          let videos = challenges.map((x) => x.videoId);
          const likes = await db.challengesLikes.findOne({
            where: { userId: req.body.blockedUserId },
          });
          if (likes && Object.keys(likes.dataValues.items).length) {
            videos.forEach((y) => {
              delete likes.dataValues.items[y];
            });
            await db.challengesLikes.update(
              { items: { ...likes.dataValues.items } },
              { where: { id: likes.dataValues.id } }
            );
          }
        }
        community = await db.community.findOne({
          where: { userId: req.body.blockedUserId },
        });
        const challenges = await db.challenges.findAll({
          attributes: ["userId", "videoId"],
          where: { userId: req.body.blockedUserId },
        });
        let videos = challenges.map((x) => x.videoId);
        const likes = await db.challengesLikes.findOne({
          where: { userId: req.token.id },
        });
        if (likes && Object.keys(likes.dataValues.items).length) {
          videos.forEach((y) => {
            delete likes.dataValues.items[y];
          });
          await db.challengesLikes.update(
            { items: { ...likes.dataValues.items } },
            { where: { id: likes.dataValues.id } }
          );
        }
        if (community) {
          let newObj = {};
          newObj = community.dataValues.friendId;
          if (newObj) delete newObj[req.token.id];
          await db.community.update(
            { friendId: newObj },
            { where: { userId: req.body.blockedUserId } }
          );
        }
        res.status(201).send({
          statusCode: 201,
          success: true,
          message: "insert successfully",
        });
      }
    })
    .catch((err) => {
      console.log(err);
      validate(err, res);
    });
};

exports.bulkcreate = (req, res) => {
  if (Object.keys(req.body).length === 0)
    res.status(200).send({
      success: false,
      data: null,
      message: "request body can't be null",
    });
  else
    db.blocklist
      .bulkCreate(req.body, { validate: true })
      .then((data) => {
        var socket = req.app.get("socket");
        if (socket) {
          socket.emit("findAllblocklist", data);
          socket.broadcast.emit("findAllblocklist", data);
        }
        res.status(201).send({
          statusCode: 201,
          success: true,
          message: "insert successfully",
        });
      })
      .catch((err) => {
        validate(err, res);
      });
};

exports.update = (req, res) => {
  db.blocklist
    .update(req.body, {
      where: { id: req.params.id },
    })
    .then((data) => {
      console.log(data[0]);
      if (!data[0])
        res.status(409).send({
          statusCode: 409,
          success: false,
          message: "blocklist not found",
        });
      else
        res.status(200).send({
          statusCode: 200,
          success: true,
          message: "blocklist update successfully",
        });
    })
    .catch((err) => {
      res.send({
        statusCode: 201,
        error: validate(err, res),
      });
    });
};

exports.delete = (req, res) => {
  db.blocklist
    .destroy({
      where: { blockedUserId: req.params.id, userId: req.token.id },
    })
    .then((data) => {
      if (data == 0)
        res.status(400).send({
          statusCode: 400,
          success: false,
          message: "blocklist not exists",
        });
      else
        res.status(200).send({
          message: "delete successfully",
        });
    })
    .catch((err) => {
      res.send(err);
    });
};

exports.findOne = (req, res) => {
  db.blocklist
    .findOne({
      where: { id: req.params.id },
    })
    .then((data) => {
      if (data == null)
        res.status(404).send({
          statusCode: 404,
          success: false,
          message: "blocklist not found",
        });
      else
        res.status(200).send({
          statusCode: 200,
          success: true,
          data: data,
        });
    })
    .catch((err) => {
      res.send(err);
    });
};
