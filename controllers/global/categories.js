const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

exports.create = (req,res) => {
    db.categories.create({
        name:req.body.name,
        parentId:req.body.parentId,
    }).then(data=>{
        res.status(200).send({
            success:true,
            message:"record has been inserted successfully",
            data
        })
        }).catch(err => {
            res.status(400).send({
            success:false,
            message:"some error occured while inserting record."
            })
    })
}

exports.getAll = (req,res) => {
    let id = req.params.id;
    db.categories.findAll({where:{parentId:id}}).then(data => {
        res.status(200).send({
            success:true,
            message:"Records has been fetched successfully",
            data
        })
    }).catch(err => {
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching data."
        })
    })
}