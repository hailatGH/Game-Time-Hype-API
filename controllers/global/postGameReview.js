const db = require("../../models");
const validate = require("../../validation");

db.postGameReview.belongsTo(db.matchVideo);

exports.create = (req,res) => {
    req.body.date = new Date(req.body.date);
   db.postGameReview.create({...req.body,userId:req.token.id}).then(data=>{
    if(data){
        res.status(200).send({
            success:true,
            message:"Record has been inserted successfully.",
            data
        })
    }
   })
}

exports.findByDate = (req,res) => {
    if(req.body.date){
        db.postGameReview.findOne({
            where:{
                date:new Date(req.body.date),userId:req.token.id
            },
            include:[
                {model:db.matchVideo,attributes:['videoId','thumbnailId','title','createdAt']}
            ]
        }
        )
        .then((data)=>{
            if(data){
                res.status(200).send({
                    success:true,
                    message:"record has been fetched successfully.",
                    data
               })
            }else{
                res.status(200).send({
                    success:true,
                    message:"No Record has been found on that day",
                    data:null
                })
            }
        }).catch(err=>{
            res.status(400).send({
                success:false,
                message:"some error has been occured while fetching data."
            })
        })
    }
   
}

exports.update = (req,res) => {
    if(req.params.id && req.body){
        db.postGameReview.update({...req.body},{where:{id:req.params.id}}).then(data=>{
            if(data){
                res.status(200).send({
                    success:true,
                    message:"Record has been updated successfully.",
                })
            }else{
                res.status(400).send({
                    success:false,
                    message:"some error occured while updating record.",
                })
            }
        }).catch(err=>{
            res.status(400).send({
                success:true,
                message:"some error has been occured while updating record."
            })
        })
    }else{
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching record."
        })
    }
}

exports.findOneLatest = (req,res) =>{
    db.postGameReview.findOne({
        include:[
            {model:db.matchVideo,attributes:['id','videoId','thumbnailId','createdAt']}
        ],
        where:{userId:req.token.id},
        order:[['createdAt','DESC']]
    })
    .then(data=>{
        if(data){
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                data
            })
        }else{
            res.status(200).send({
                success:true,
                message:"No record has been found in DB for you.",
                data:null
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"Some error has been occured while fetching Record."
        })
    })
}