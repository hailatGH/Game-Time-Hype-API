const { Op, QueryTypes } = require("sequelize")
const db = require("../../models")
const validation = require("../../validation")

exports.create = (req,res) => {
    db.gamePractices.create({
        ...req.body,
        date:new Date(req.body.date),
        userId:req.token.id
    }).then(data => {
        res.status(200).send({
            success:true,
            data
        })
    }).catch(err => {
        validation(err,res)
        res.status(400).send({
            success:false
        })
    })
}

exports.getByDate = (req,res) => {
    db.gamePractices.findAll({
        where:{userId:req.token.id,
        date:{
            [Op.between]:[new Date(req.body.startDate),new Date(req.body.endDate)]
        }},
    }).then(data => {
        res.status(200).send({
            success:true,
            data
        })
    }).catch(err => {
        validation(err,res)
        res.status(400).send({
            success:false
        })
    })
}

exports.update = (req,res) => {
    db.gamePractices.update({practiseTime:req.body.practiseTime,notes:req.body.notes},{
        where:{id:req.body.id},
    }).then(data => {
        res.status(200).send({
            success:true,
            message:"Record has been successfully Updated"
        })
    }).catch(err => {
        validation(err,res)
        res.status(400).send({
            success:false
        })
    })
}

// exports.getChartDetails = (req,res) => {
//      db.sequelize.query(`select SUM("practiseTime") as total,EXTRACT(MONTH FROM date)as month from public."gamePractises" where "userId"='${req.token.id}' and date_part('year',date) = ${new Date().getFullYear()} group by EXTRACT(MONTH FROM date)`,{QueryTypes:"SELECT"}).then(data=>{
//         if(!data){
//             res.status(400).send({
//                 success:false,
//                 message:"some error occured while fetching data."
//             })
//         }else{
//             res.status(200).send({
//                 success:true,
//                 message:"Records has been fetched successfully.",
//                 data:data[0]
//             })
//         }
//     }).catch(err=>{
//         res.status(400).send({
//             success:false,
//             message:"some error has been occured while fetching Records."
//         })
//     })
// }

// exports.getChartDetailsById = (req,res) => {
//     let id = req.params.id
//    if(id){
//     db.sequelize.query(`select SUM("practiseTime") as total,EXTRACT(MONTH FROM date)as month from public."gamePractises" where "userId"='${id}' and date_part('year',date) = ${new Date().getFullYear()} group by EXTRACT(MONTH FROM date)`,{QueryTypes:"SELECT"}).then(data=>{
//         if(!data && data.length==0){
//             res.status(400).send({
//                 success:false,
//                 message:"No record found on this id."
//             })
//         }else{
//             res.status(200).send({
//                 success:true,
//                 message:"Records has been fetched successfully.",
//                 data:data[0]
//             })
//         }
//     }).catch(err=>{
//         res.status(400).send({
//             success:false,
//             message:"some error has been occured while fetching Records."
//         })
//     })
//    }else{
//     res.status(400).send({
//         success:false,
//         message:"Please provide valid id in params"
//     })
//    }
// }