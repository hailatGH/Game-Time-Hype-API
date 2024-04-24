const db = require("../../models");

exports.sendToken = (req, res) => {
  if (req.body.token && req.body.packageName) {
    db.androidToken.upsert({ userId: req.token.id,token:req.body.token,packageName:req.body.packageName}).then(data=>{
        res.status(200).send({
            success:true,
            message:"Record has been added successfully."
        })
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"Some error has been occured while inserting record."
        })
    })
  }
};
