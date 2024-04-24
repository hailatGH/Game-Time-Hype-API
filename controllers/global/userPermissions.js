const { Sequelize, Op, where } = require("sequelize");
const db = require("../../models");

exports.create = (req, res) => {
   db.userPermissions.create({...req.body}).then(data=>{
    if(data){
        res.status(200)
        .send({success:true,message:"record has been inserted successfully",data})
    }else{
        res.status(400)
        .send({success:false,message:"some error occured while inserting record"})
    }   
   }).catch(err=>{
        res.status(400)
        .send({success:false,message:"some error has been occured while inserting record"})
   })
};

exports.getAll = (req, res) => {
    let id = req.params.id;
    db.userPermissions.findOne({where:{userId:id},attributes:['userId',"modules"]}).then(data=>{
        if(data){
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                data
            })
        }else{
            res.status(200).send({
                success:false,
                message:"record not found.",
                data:[]
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching record."
        })
    })
};

exports.updateData = (req,res) => {
    db.userPermissions.upsert({modules:req.body.modules,userId:req.body.userId})
    .then(data=>{
        if(data[0]){
            res.status(200).send({
                success:true,
                message:"Record has been updated successfully."
            })
        }else{
            res.status(400).send({
                success:false,
                message:"some error occured while updating record"
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"please provide valid userId in the body."
        })
    })
}   