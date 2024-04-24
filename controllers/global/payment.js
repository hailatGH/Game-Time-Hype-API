const db = require("../../models");
const validate = require("../../validation");

exports.getAll=(req,res) => {
    db.payment.findAll({
        order:[["createdAt","DESC"]]
    }).then(data=>{
        res.status(200).send({
            success:true,
            message:"Record has been fetched successfully.",
            data
        })
    }).catch(err=>{
        res.status(400).send({
            success:true,
            message:"Some error has been occured while fetching data."
        })
    })
}

exports.insert = (req,res) => {
    req?.body?.amount ? req.body.amount = parseInt(req.body.amount)/100 : ""
    db.payment.create({...req.body,userId:req.token.id})
    .then(data=>{
        if(data){
            res.status(200).send({
                success:true,
                message:"data has been inserted successfully",
                data
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured from database"
        })
    })
}