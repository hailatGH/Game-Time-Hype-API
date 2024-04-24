const db = require("../../models");
const validate = require("../../validation");

exports.bulkCreate =(req,res) => {
    let data = req.body;
    db.sports.bulkCreate(data).then((data) => {
        res.status(200).send({
            success:true,
            message:"records has been added successfully",
            data
        })
    }).catch((err) => {
        validate(err,res);
        res.status(200).send({
            success:false,
            message:"some error has been occured while adding records."
        })
    });
}

exports.findAll = (req,res) => {
    db.sports.findAll({attributes:{exclude:['createdAt','updatedAt']}}).then((data) => {
        res.status(200).send({
            success:true,
            message:"sports has been fetched successfully",
            data
        })
    })
}