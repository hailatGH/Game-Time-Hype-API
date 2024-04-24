const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

exports.getData = async(req,res) => {
    if(req.query.isAndroid){
        db.googleAds.findOne({where:{isAndroid:req.query.isAndroid},attributes:{exclude:['createdAt','updatedAt']}},{order:[["createdAt","Desc"]]}).then(data => {
            res.status(200).send({
                success:true,
                message:"google ads has been successfully fetched",
                data
            })    
        }).catch(err =>{
            res.status(400).send({
                success:false,
                message:"some error occured while fetching google ads",
            })
    })
    }else{
        res.status(400).send({
            success:false,
            message:"Provide isAndroid in the query."
        })
    }

}

exports.create = (req,res) => {
       if(req.body.appOpen && req.body.banner && req.body.interstitial && req.body.nativeAdvanced && req.body.rewarded && (req.body.status==true || req.body.status==false)){
        db.googleAds.upsert(req.body).then(data=>{
            res.status(200).send({
                success:true,
                message:"Record has been updated successfully."
            })
        }).catch(err=>{
            res.status(400).send({
                success:true,
                message:"some error has been occured while updating record."
            })
        })
       }else{
            res.status(400).send({
                success:false,
                message:"please provide appOpen,banner,interstitial,nativeAdvanced,rewarded,status in the body"
            })
       }
}