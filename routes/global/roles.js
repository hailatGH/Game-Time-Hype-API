const db = require("../../models");

module.exports = (app) =>{
    var router = require("express").Router();

    router.post("/",(req,res)=>{
        db.roles.bulkCreate(req.body).then(data=>{
            res.status(200).send({
                success:true,
                message:"record has been inserted successfully"
            })
        }).catch(err=>{
            res.status(400).send({
                success:false,
                message:"some error occured while inserting record."
            })
        })
    })

    app.use("/api/roles",router)
}