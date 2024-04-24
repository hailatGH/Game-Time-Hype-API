const { Sequelize, Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

exports.insertData = (req, res) => {
  let Obj = new Object(req.body.friendId);
  db.community
    .findOrCreate({
      where: { userId: req.token.id },
    })
    .then((data) => {
      let newObj = { ...data[0].dataValues.friendId, [Obj]: Obj };
      db.community
        .update({ friendId: newObj }, { where: { userId: req.token.id } })
        .then((data) => {
          if (data[0]) {
            res.status(200).send({
              success: true,
              message: "record has been inserted.",
            });
          } else {
            res.status(400).send({
              success: false,
              message: "Some error has been thrown at inserting time.",
            });
          }
        })
        .catch((err) => {});
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occurred.",
      });
    });
};

exports.getData = (req, res) => {
  let name = req.body.name;
  if (name) {
    db.community.findAll({ where: { userId: req.token.id } }).then((data) => {
      if (data && data.length > 0) {
        db.users
          .findAll({
            where: {
              fullname: { [Op.iLike]: `%${req.body.name.toLowerCase()}%` },
              id: Object.keys(data[0].dataValues.friendId),
              roleId: { [Op.notIn]: [4, 5] },
            },
            attributes: ["id", "fullname", "profileImagePath", "university"],
          })
          .then((data) => {
            res.status(200).send({
              success: true,
              message: "Record has been successfully fetched.",
              data,
            });
          })
          .catch((err) => {
            res.status(400).send({
              success: false,
              message: "Some error occurred while fetching Record.",
            });
          });
      } else {
        res.status(200).send({
          success: true,
          message: "No friends found in the community.",
        });
      }
    });
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid name in the body.",
    });
  }
};

exports.getAll = (req, res) => {
  db.community.findAll({ where: { userId: req.token.id } }).then((data) => {
    if (data && data.length > 0) {
      db.users
        .findAll({
          where: {
            id: Object.keys(data[0].dataValues.friendId),
            roleId: { [Op.notIn]: [4, 5] },
          },
          attributes: ["id", "fullname", "profileImagePath", "university"],
        })
        .then((data) => {
          res.status(200).send({
            success: true,
            message: "Record has been successfully fetched.",
            data,
          });
        })
        .catch((err) => {
          res.status(400).send({
            success: false,
            message: "Some error occurred while fetching Record.",
          });
        });
    } else {
      res.status(200).send({
        success: true,
        message: "No friends found in the community.",
      });
    }
  });
};
