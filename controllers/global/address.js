const { Op, where } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

exports.getAll = (req, res) => {

  console.log("Hitting get all endpoint");
  
  db.addresses.belongsTo(db.states)
  db.addresses
    .findAll({
      where: { userId: req.token.id },
      include:[{
        model:db.states,
        attributes:{exclude:['createdAt','updatedAt']}
      }],
      attributes: { exclude: ["userId", "createdAt", "updatedAt"] },
    })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "Records has been fetched successfully.",
        data,
      });
    }).catch(err=> {
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching data from DB."
        })
    })
};

exports.create = (req, res) => {
  console.log("Hitting create ednpoint");
  
  db.addresses
    .create({
      ...req.body,
      userId: req.token.id,
    })
    .then((data) => {
      res.status(201).send({
        success: true,
        message: "Record has been inserted successfully",
      });
    })
    .catch((err) => {
      validate(err,res)
    });
};

exports.delete = (req, res) => {
  db.addresses
    .destroy({
      where:{id: req.body.id,userId:req.token.id},
    })
    .then((data) => {
        if(data){
            res.status(200).send({
                success: true,
                message: "records has been successfully deleted",
            });
        }
        else{
            res.status(200).send({
                success: true,
                message: "Record has been not found in DB.",
            });
        }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "Some error occured while deleting records.",
      });
    });
};

exports.update = (req, res) => {
  let id = req.body.id;
  delete req.body.id;
  if(id){
    db.addresses.update({...req.body},{where:{id:id}}).then(data=> {
        if(data[0]){
        res.status(200).send({
            success:true,
            message:"Record has been updated successfully.",
        })}
        else{
            res.status(400).send({
                success:false,
                message:"No records has been found on this Id."
            })
        }
    }).catch(err => {
        res.status(400).send({
            success:false,
            message:"Some error occured while updating record."
        })
    })
  }else{
    res.status(400).send({
        success:false,
        message:"please pass valid id in the body",
    })
  }
};
