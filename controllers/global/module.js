const db = require("../../models");
const validate = require("../../validation");

db.modules.hasMany(db.modules, { as: "module" });
db.modules.hasMany(db.modules);

exports.getAll=(req,res)=>{
    db.modules.findAll({
     where: { moduleId: null },
     include: [
       {
         model: db.modules,
         as: "module",
       },
     ],
     order:[['id','ASC']]
   }).then(data=>{
     if(data){
       res.status(200).send({
         success:true,
         message:"Record has been fetched successfully.",
         data
       })
     }else{
       res.status(404).send({
         success:false,
         message:"No record Found in DB.",
         data
       })
     }
   }).catch(err=>{
     res.status(400).send({
       success:false,
       message:"Some error has been occured while fetching data from DB."
     })
   })
 }
 
 exports.getById = (req,res) => {
     if(req.params.id){
       db.modules.findOne({ where: { id: req.params.id } })
       .then(data=>{
         if(data){
           res.status(200).send({
             success:true,
             message:"Record has been fetched successfully.",
             data
           })
         }else{
           res.status(404).send({
             success:false,
             message:"No record Found in DB.",
             data
           })
         }
       }).catch(err=>{
         res.status(400).send({
           success:false,
           message:"Some error has been occured while fetching data from DB."
         })
       })
     }else{
       res.status(400).send({
         success:false,
         message:"provide valid id in params"
       })
     }
 }
 
 exports.insertModule = async(req,res) => {
   if (Array.isArray(req.body)) {
    //  let modules = [];
    const modules = await db.modules.bulkCreate(req.body,{include: [
             {
               model: db.modules,
             },
           ]},)
     if(modules.length){
       res.status(200).send({
         success:true,
         message:"records has been inserted successfully"
       })
     }else{
       res.status(400).send({
         success:false,
         message:"some error has been occures while inserting record"
       })
     }
   } else {
     const { name } = req.body;
     const Exist = await db.modules.findOne({
       where: { name: name },
     });
     if (Exist)
       return res.code(409).send({
         msg: "module alerady exist",
         data: Exist,
       });
    db.modules.create(req.body, {
       include: [
         {
           model: db.modules,
         },
       ],
     }).then(data=>{
       if(data){
         res.status(200).send({
           success:true,
           message:"Record has been inserted successfully.",
           data
         })
       }
       else{
         res.status(400).send({
           success:false,
           message:"some error occured while inserting record.",
           data
         })
       }
     }).catch(err=>{
       res.status(400).send({
         success:false,
         message:"Some error has been occured while inserting record."
       })
     })
   }
 }
 
 exports.update = (req,res) => {
   const { id } = req.body;
       delete req.body.id;
       delete req.body.createdAt;
       delete req.body.updatedAt;
       db.modules.update(req.body, {
         where: { id: id },
         returning: true,
       }).then(data=>{
         if(data){
          res.status(200).send({
            success:true,
            message:"Record has been updated successfully."
          })
         }
       }).catch(err=>{
         res.status(400).send({
          success:false,
          message:"some error has been occured while updating record."
         })
       })
 }
 
 exports.delete = (req,res) => {
   const { id } = req.params;
   db.modules.destroy({
     where: { id: id },
   }).then(data=>{
     if(data){
       res.status(200).send({
         success:true,
         message:"Record has been deleted successfully."
       })
     }else{
      res.status(400).send({  
        success:false,
        message:"some error occured while updating record."
      })
     }
   }).catch(err=>{
     res.status(400).send({
       success:false,
       message:"some error has been occured while deleting record."
     })
   })
 }