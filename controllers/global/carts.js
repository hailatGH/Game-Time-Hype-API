const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

const { v4: uuidv4 } = require("uuid");

let uuid = uuidv4();

exports.getAll = (req, res) => {
    db.carts.findAll({
        include:[
            {
                model:db.merchandise,attributes:{exclude:['media','baseprice','discountPercentage','quantity','']},
                include:[
                    {model:db.categories,attributes:['id','name']}
                  ],
            },
          ],
          where:{userId:req.token.id}
    }).then(data => {
        res.status(200).send({
            success:true,
            message:"records has been fetched successfully",
            data
        })
    }).catch(err=>{
        res.status(400).send({
            success:true,
            message:"records has been fetched successfully"
        })
    })
};

exports.create = (req, res) => {
    let size = req.body.size ? req.body.size : null
    db.carts.findOrCreate({
        where:{userId:req.token.id,
        merchandiseId:req.body.id,
        size:size},
        defaults:{
            qty:req.body.qty    
        }
    }).then(data=> {
        if(data[1] == false){
            let oldQty = data[0].dataValues.qty;
            let newQty = oldQty + req.body.qty;
            db.carts.update({qty:newQty},{where:{id:data[0].dataValues.id}})
            .then(data=>{
                if(data[0]){
                    res.status(200).send({
                        success:true,
                        message:"Prdoct has been added into cart successfully"
                    })
                }
            }).catch(err=>{
                res.status(400).send({
                    success:false,
                    message:"Some error has been occured while adding record into cart."
                })
            })
        }
        else{
            res.status(200).send({
            success:true,
            message:"Record has been added successfully",
        })
    }    
    }).catch(err => {
        res.status(400).send({
            success:false,
            message:"Some error occured while inserting record."
        })
    })
};

exports.delete = (req, res) => {
  db.carts.destroy({
    where:{id:req.body.deletedItems}
  }).then(data => {
    res.status(200).send({
        success:true,
        message:"records has been successfully deleted"
    })
  }).catch(err => {
    res.status(400).send({
        success:false,
        message:"Some error occured while deleting records."
    })
  })
};

exports.update = (req,res) => {
    let id=req.body.id;
    delete req.body.id
    db.carts.update({qty:req.body.qty},{
        where:{id:id}
    }).then(data => {
        res.status(200).send({
            success:true,
            message:"Records has been successfully updated"
        })
    })
}