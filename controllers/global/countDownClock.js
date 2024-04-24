const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");
const { v4: uuidv4 } = require("uuid");

exports.insertData = (req, res) => {
  const value = {
    ...req.body,
  };
  let Obj = new Object(value);
  db.countDownClock
    .findOrCreate({
      where: { userId: req.token.id },
    })
    .then((data) => {
        let uuid = uuidv4();
      let countdata = { ...data[0].dataValues.items, [uuid]: Obj };
      db.countDownClock
        .update({ items: countdata }, { where: { userId: req.token.id } })
        .then((data) => {
          res.status(200).send({
            success: true,
            message: "record has been inserted",
            uuid
          });
        })
        .catch((err) => {
        });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while inserting record",
      });
    });
};

exports.getAll = (req, res) => {
  db.countDownClock
    .findAll({ where: { userId: req.token.id } })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "Record has been fetched successfully",
        data:data[0]?.dataValues?.items,
      });
    })
    .catch((err) => {
      validate(err, res);
      res.status(400).send({
        success: false,
        message: "some error occured while fetching data from DB",
      });
    });
};

exports.update = (req, res) => {
  let id = req.body.id;
  delete req.body.id;
  if (id) {
    db.countDownClock
      .findOne({ where: { userId: req.token.id } })
      .then((data) => {
        if (!data) {
          res.status(402).send({
            success: false,
            message: "No record has been found on this id",
          });
        } else {
          let allProperty = data.dataValues.items;
          let oldProperty = allProperty[id];
          let newProperty = req.body;
          let combineProperty = {...oldProperty,...newProperty}
          let temp = { [id]: combineProperty };
          db.countDownClock
            .update({ items: {...allProperty, ...temp}}, { where: { userId:req.token.id } })
            .then((data) => {
              if (data[0] === 0) {
                res.status(400).send({
                  success: false,
                  message: "Some error occured while updating Record.",
                });
              } else {
                res.status(200).send({
                  success: true,
                  message: "Record has been updated successfully.",
                });
              }
            });
        }
      })
      .catch((err) => {
        res.status(402).send({
          success: false,
          message: "Provide valid id in the body",
        });
      });
  } else {
    res.status(400).send({
        success:false,
        message:"please provide valid id in the body."
    })
  }
};

exports.delete = (req,res) => {
    let id = req.body.id;
    delete req.body.id;
    if (id) {
      db.countDownClock
        .findOne({ where: { userId: req.token.id } })
        .then((data) => {
          if (!data) {
            res.status(402).send({
              success: false,
              message: "No record has been found on this id",
            });
          } else {
            let allProperty = data.dataValues.items;
            delete allProperty[id]
            db.countDownClock
              .update({ items: allProperty}, { where: { userId:req.token.id } })
              .then((data) => {
                if (data[0] === 0) {
                  res.status(400).send({
                    success: false,
                    message: "Some error occured while updating Record.",
                  });
                } else {
                  res.status(200).send({
                    success: true,
                    message: "Record has been updated successfully.",
                  });
                }
              });
          }
        })
        .catch((err) => {
          res.status(402).send({
            success: false,
            message: "Provide valid id in the body",
          });
        });
    } else {
      res.status(400).send({
          success:false,
          message:"please provide valid id in the body."
      })
    }
}