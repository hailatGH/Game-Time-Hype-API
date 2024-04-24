const db = require("../../models");
const validate = require("../../validation");

exports.create = (req,res) => {
    db.pregamegoals.create({
        ...req.body,
        userId:req.token.id
    }).then(async(data) =>{  
        let temp = await data.get();
        delete createdAt
        delete updatedAt
        delete userId
        await res.status(200).send({
            success:true,
            message:"Note has been successfully added",
            data:temp
        })
    }).catch(err =>{
        validate(err,res)
        console.error(err);
    })
}

exports.findAll = (req,res) => {
    db.pregamegoals.findAll({
        where:{userId:req.token.id},
        order:[['createdAt','Desc']]
    }).then(async(data) =>{
        res.status(200).send({
            success:true,
            message:"Notes has been successfully fetched",
            data
        })
        }).catch(err =>{
            validate(err,res)
            console.error(err);
            res.status(400).send({
                success:false,
                message:"some error has been occurred while fetching notes",
            })
    })
}

exports.update = (req,res) => {
    db.pregamegoals.update({
        ...req.body,
        userId:req.token.id
    },{
        where:{id:req.params.id},
    }).then(data => {
       res.status(200).send({
            success:true,
            message:"Notes has been successfully updated",
        })
        }).catch(err =>{
            validate(err,res)
            console.error(err);
            res.status(400).send({
                success:false,
                message:"some error has been occurred while updating note",
            })
    })
}

exports.delete = (req,res) => {
    db.pregamegoals.destroy({
        where:{id:req.params.id},
    }).then(data => {
       res.status(200).send({
            success:true,
            message:"Notes has been successfully deleted",
        })
    }).catch(err =>{
        validate(err,res)
        console.error(err);
        res.status(400).send({
            success:false,
            message:"some error has been occurred while deleting note",
        })
    })
}

exports.findOneLatest = (req,res) =>{
    db.pregamegoals.findOne({
        where:{userId:req.token.id},
        order:[['createdAt','Desc']]
    }).then(async(data) =>{
        res.status(200).send({
            success:true,
            message:"Notes has been successfully fetched",
            data
        })
        }).catch(err =>{
            validate(err,res)
            console.error(err);
            res.status(400).send({
                success:false,
                message:"some error has been occurred while fetching notes",
            })
    })
}