const db = require("../../models");

exports.insert = async(req,res) => {
    let amount = parseInt(req.body.amount);
    if(amount){
        let roleId = await db.users.findOne({where:{id:req.token.id},attributes:['roleId']})
    if(roleId.dataValues.roleId==4){
        db.shippingRate.upsert({amount:amount,userId:req.token.id})
    .then(data=>{
        res.status(200).send({
            success:true,
            message:"Record has been updated successfully.",
            data
        })
    }).catch(err=> {
        res.status(400).send({
            success:false,
            message:"some error has been occured while updating record."
        })
    })
    }else{
        res.status(400).send({
            success:false,
            message:"You are not authorize to this Route"
        })
    }
    }else{
        res.status(400).send({
            success:false,
            message:"provide valid amount in the body."
        })
    }
}

exports.getAll = (req,res) => {
    db.shippingRate.findOne({
        order:[['createdAt','DESC']]
    })
    .then(data=>{
        res.status(200).send({
            success:true,
            message:"Record has been fetched successfully.",
            data
        })
    }).catch(err=> {
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching record record."
        })
    })
}
