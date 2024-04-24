const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

exports.getData = async(req,res) => {
    let date = new Date(req.body.date);
    if(date)
    {db.hockey.findAll({where:{userId:req.token.id,date:date},attributes:{exclude:['id','userId','date','createdAt','updatedAt']}}).then(data => {
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
        db.hockey.create({
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

exports.getAllUserdata = (req,res) => {
    db.sequelize.query(`select sum(score)as score,"userId","fullname","profileImagePath" from hockeys,users where users."id"=hockeys."userId" group by "userId","fullname","profileImagePath" order by "score" DESC`,{QueryTypes:"SELECT"})
    .then(data=>{
        if(!data){
            res.status(400).send({
                success:false,
                message:"Some error occured while fetching data."
            })
        }else{
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                data:data[0]
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"Some error has been occured while fetching data."
        })
    })
}

exports.getAllUserdataAdmin = (req,res) => {
    let { page, limit } = req.query;
    let offset = page * limit
    db.sequelize.query(`select ROW_NUMBER() OVER (ORDER BY sum("hockeys"."score") DESC) AS Userrank,sum(score)as score,"userId","fullname","profileImagePath","gender","age" from hockeys,users where users."id"=hockeys."userId" group by "userId","fullname","profileImagePath","gender","age" LIMIT ${limit} offset ${offset}`,{QueryTypes:"SELECT"})
    .then(async(data)=>{
        if(!data){
            res.status(400).send({
                success:false,
                message:"Some error occured while fetching data."
            })
        }else{
            let count =await  db.sequelize.query(`select count(distinct "userId")as count from hockeys`,{QueryTypes:"SELECT"})
            count = parseInt(count[0][0].count)
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                count,
                data:data[0]
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"Some error has been occured while fetching data."
        })
    })
}