const db = require("../../models");
const validate = require("../../validation");

db.refund.belongsTo(db.users)
db.refund.belongsTo(db.payment)

exports.insert = (req,res) => {
    let orderId = req.body.orderId;
    db.order.findOne({where:{id:orderId}}).then(async(data)=>{
        let orderdata = data.get();
        if(orderdata && Object.keys(orderdata).length){
            let obj = new Object(orderdata.product)
            for(const property in obj){
                let id = property;
                let value = obj[property];
                    await db.merchandise.increment(
                        {...obj[property]},
                        {where:{id:id}}
                    )
            }
            db.refund.create({
                amount:orderdata.TotalAmount,
                userId:orderdata.userId,
                paymentId:orderdata.paymentId,
                orderId:orderdata.id
            }).then(async(data)=>{
                if(data){
                    await db.order.update({status:3},{where:{id:orderdata.id}})
                    res.status(200).send({
                        success:true,
                        message:"Refund process has been started successfully.your money will be refunded in your account."
                    })
                }else{
                    res.status(400).send({                              
                        success:false,
                        message:"some error occured while inserting data in the refund."
                    })
                }
            }).catch(err=>{
                res.status(400).send({
                    success:false,
                    message:"Some error hasbeen occured while inserting record in the refund."
                })
            })
        }else{
            res.status(400).send({
                success:false,
                message:"provide valid orderId"
            })
        }
    })
}   

exports.getAll = async(req,res) =>{
    let { page, limit ,status} = req.query;
    let where = {}
    if(status==1){
        where.isRefunded=true
    }else if(status==0){
        where.isRefunded=false
    }
    const {count,rows} = await db.refund.findAndCountAll({
        include:[
            {model:db.users,attributes:['fullname','profileImagePath']},
            {model:db.payment,attributes:['createdAt','stripeId','amount','paymentMethod']}
        ],
        order:[['createdAt','DESC']],
        where:where,
        limit:limit,
        offset:page*limit
    })
    res.status(200).send({
        success:true,
        message:"Record has been fetched successfully.",
        count,
        data:rows
})
}

exports.update = (req,res) => {
    let id = req.body.id;
    delete req.body.id;
    db.refund.update({
        ...req.body
    },{where:{id:id}}).then(data=>{
        if(data[0]){
            db.refund.findOne({where:{id:id}}).then(data=>{
                db.payment.update({status:3},{where:{id:data.dataValues.paymentId}}).then(data1=>{
                    if(data1){
                        res.status(200).send({
                            success:true,
                            message:"Record has been updated successfully"
                        })
                    }
                })
            })
        }else{
            
        }   
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured while updating data."
        })
    })
}