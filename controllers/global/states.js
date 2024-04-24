const db = require("../../models");
const validate = require("../../validation");

exports.bulkCreate =(req,res) => {
    let data = req.body;
    db.states.bulkCreate(data).then((data) => {
        res.status(200).send({
            success:true,
            message:"records has been added successfully",
            data
        })
    }).catch((err) => {
        validate(err,res);
        res.status(200).send({
            success:false,
            message:"some error has been occured while inserting records."
        })
    });
}

exports.findAll = (req,res) => {
    db.states.findAll({attributes:{exclude:['createdAt','updatedAt']}}).then((data) => {
        res.status(200).send({
            success:true,
            message:"states has been fetched successfully",
            data
        })
    })
}