const { Op } = require("sequelize");
const db = require("../../models");
const validation = require("../../validation");
const removeFile = require("./removeFile");

exports.getAll = (req,res) => {
    let categoryId = parseInt(req.params.id);
    let page = parseInt(req.params.page);
    if(categoryId==1 || categoryId==2 || categoryId==3 || categoryId==4){
        db.games.findAll({where:{categoryId:categoryId},limit:20,offset:page*20}).then(data=>{
            if(!data){
                res.status(400).send({
                    success:false,
                    message:"some error occured while fetching record"
                })
            }else{
                res.status(200).send({
                    success:true,
                    message:"record has been fetched successfully.",
                    data
                })
            }
        })
    }else{
        res.status(400).send({
            success:false,
            message:"please provide valid categoryId in params."
        })
    }
}

exports.create = (req,res) => {
    let categoryId = parseInt(req.body.categoryId)
    if (req.file) {
        req.body.thumbnail=req.file.filename;
        if(req.body.title && req.body.playStoreLink && categoryId && req.body.appStoreLink){
            db.games.create({
                ...req.body,
                userId:req.token.id
            }).then(data=>{
                res.status(200).send({
                    success:true,
                    message:"Record has been inserted successfully.",
                    data
                })
            }).catch(err=>{
                res.status(400).send({
                    success:false,
                    message:"some error occured while inserting record.",
                })
            })
        }else{
            res.status(400).send({
                success:false,
                message:"please pass valid title,playstorelink,appstorelink,categoryid in the body.",
            })
        }
    }else{
        res.status(400).send({
            success:false,
            message:"please pass valid thumbnail.",
        })
    }
}

exports.delete = async(req,res) => {
    let id = req.params.id;
    if(id){
    await db.games.findOne({where:{id:id}}).then(data => {
        if(!data){
          res.status(400).send({
            success: false,
            message: "game has been not found in db.",
          });    
        }else{
          removeFile(data.thumbnail)
          db.games.destroy({where:{id:id}}).then(data =>{
            if(!data){
                res.status(400).send({
                    success: false,
                    message: "some error occured while deleting game.",
                  });
            }else{
                res.status(200).send({
                    success: true,
                    message: "game has been deleted successfully.",
                  });
            }
          })
        }
    }).catch(err=> {
        res.status(400).send({
            success:false,
            message:"some error occured while deleting Record from DB."
        })
    })
    }else{
        res.status(400).send({
            success:false,
            message:"please provide valid id in params."
        })
    }
}

exports.getAllAdmin = (req,res) => {
    let { page, limit } = req.query;
        db.games.findAll({limit:limit,offset:page*limit}).then(async(data)=>{
            if(!data){
                res.status(400).send({
                    success:false,
                    message:"some error occured while fetching record"
                })
            }else{
                let count =await db.sequelize.query(`select count(*)as count from "games"`,{QueryTypes:"SELECT"})
                count = parseInt(count[0][0].count);
                res.status(200).send({
                    success:true,
                    message:"record has been fetched successfully.",
                    count,
                    data
                })
            }
        })
}
