const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

exports.getData = async(req,res) => {
    let date = new Date(req.body.date);
    if(date)
    {db.baseballs.findAll({where:{userId:req.token.id,date:date},attributes:{exclude:['id','userId','date','createdAt','updatedAt']}}).then(data => {
        if(data){
        res.status(200).send({
            success:true,
            message:"User data has been successfully fetched",
            data
        })    
        }else{
            res.status(200).send({
                success:false,
                message:"User data has been successfully fetched",
                data:null
            }) 
        }   
    }).catch(err =>{
        res.status(400).send({
            success:false,
            message:"some error occured while fetching data",
        })
    })}else{
        res.status(400).send({
            success:false,
            message:"please provide valide date",
        })
    }
}

exports.insertData = (req,res) => {
        db.baseballs.create({
            ...req.body,
            userId:req.token.id,
            date:new Date(req.body.date)
        }).then(data => {
            res.status(200).send({
                success:true,
                message:"User data has been successfully inserted",
                data
            })    
        }).catch(err =>{
            res.status(400).send({
                success:false,
                message:"some error occured while insering data",
            })
        })
}

exports.getAllUserRank = (req,res) => {
    db.sequelize.query(`select sum("baseballs"."score")as "score","userId","fullname","profileImagePath" from baseballs,users where "baseballs"."userId" = users."id" GROUP by "userId","fullname","profileImagePath" ORDER BY "score" DESC`,{QueryTypes:"SELECT"})
    .then(data=>{
        if(!data){
            res.status(400).send({
                success:false,
                message:"Some error occured while fetching Record."
            })
        }else{
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                data:data[0]
            })
        }
    }).catch(err => {
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching records"
        })
    })
}

exports.getAllUserRankAdmin = (req,res) => {
    let { page, limit } = req.query;
    let offset = page * limit
    db.sequelize.query(`select ROW_NUMBER() OVER (ORDER BY sum("baseballs"."score") DESC) AS Userrank,sum("baseballs"."score")as "score","userId","fullname","profileImagePath","gender","age" from baseballs,users where "baseballs"."userId" = users."id" GROUP by "userId","fullname","profileImagePath","gender","age" LIMIT ${limit} offset ${offset}`,{QueryTypes:"SELECT"})
    .then(async(data) => {
        if(!data){
            res.status(400).send({
                success:false,
                message:"some error occured while fetching record",
            })
        }else{
            let count =await db.sequelize.query(`select count(distinct "userId") from baseballs`,{QueryTypes:"SELECT"})
            count = parseInt(count[0][0].count);
            res.status(200).send({
                success:true,
                message:"Records has been fetched successfully.",
                count,
                data:data[0]
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching Records."
        })
    })
}