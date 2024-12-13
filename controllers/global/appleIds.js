const { Op, where } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");
const fs = require('fs')

exports.getAppleId = (req,res) => {
    if(req.params.id){
      db.appleIds.findOne({where:{id:req.params.id}}).then(data=>{
        if(data){
          res.status(200).send({
            success:true,
            message:"Record has been fetched successfully.",
            data
          })
        }else{
          res.status(200).send({
            success:true,
            message:"Record has been not found in DB.",
            data:null
          })
        }
      }).catch(err=>{
        res.status(400).send({
          success:false,
          message:"some error has been occured while fetching data"
        })
      })
    }else{
      res.status(400).send({
        success:false,
        message:"please provide valid in params."
      })
    }
}

exports.sendAppleId = (req,res) => {
      if(req.body.id && req.body.email && req.body.firstName && req.body.lastName)  {
          db.appleIds.upsert({
            id:req.body.id,
            email:req.body.email,
          }).then((data)=>{
            if(data){
              res.status(200).send({
                success:true,
                message:"record has been inserted successfully.",
                data:(data[0].dataValues) ? data[0]?.dataValues : data
              })
            }
          })
      }else{
        res.status(400).send({
          success:false,
          message:"please provide valid id,email,firstName,lastName."
        })
      }
}

exports.appleNotification = (req, res) => {
  if(req.body.signedPayload){
    let token = req.body.signedPayload;
    let header = token.split(".")[0]
    let payload = token.split(".")[1]

function temp(data){
    var b = new Buffer.from(data, 'base64')
return b.toString();
}

let headerData = temp(header);
headerData = JSON.parse(headerData);
let temp1 = JSON.stringify(headerData.x5c.toString());

let payloadData = temp(payload);
payloadData = JSON.parse(payloadData);
let signedTransactionInfoHeader = payloadData.data.signedTransactionInfo.split(".")[0]
let signedTransactionInfoPayload = payloadData.data.signedTransactionInfo.split(".")[1]
let signedRenewalInfoHeader = payloadData.data.signedRenewalInfo.split(".")[0]
let signedRenewalInfoPayload = payloadData.data.signedRenewalInfo.split(".")[1]
signedTransactionInfoPayload = JSON.parse(temp(signedTransactionInfoPayload));
signedRenewalInfoPayload = JSON.parse(temp(signedRenewalInfoPayload));
let Obj = new Object({...signedTransactionInfoPayload,...signedRenewalInfoPayload})
Obj.notificationType=payloadData.notificationType,
Obj.subtype=payloadData.subtype,
Obj.notificationUUID=payloadData.notificationUUID,
Obj.bundleId=payloadData.data.bundleId,
Obj.bundleVersion=payloadData.data.bundleVersion,
Obj.environment=payloadData.data.environment
Obj.expiresDate ? Obj.expiresDate = new Date(Obj.expiresDate) : ""
Obj.purchaseDate ? Obj.purchaseDate = new Date(Obj.purchaseDate) : ""
Obj.originalPurchaseDate ? Obj.originalPurchaseDate = new Date(Obj.originalPurchaseDate) :""
Obj.signedDate ? Obj.signedDate = new Date(Obj.signedDate) :""
Obj.recentSubscriptionStartDate ? Obj.recentSubscriptionStartDate = new Date(Obj.recentSubscriptionStartDate) :""
Obj.subtype ? Obj.subtype :Obj.subtype = null
if(Obj.appAccountToken && Obj.expiresDate && Obj.originalTransactionId)
{
    db.premiumUser.upsert({
      userId:Obj.appAccountToken,
      expiryDate:Obj.expiresDate,
      transactionId:Obj.originalTransactionId,
      productId:Obj.productId
    }).then(data=>{
      db.appleTransactions.create(Obj).then(data=>{
        res.status(200).send()
      }).catch(err=>{
        return res.status(400).send()
      })
    }).catch(err=>{
      res.status(400).send()
    })
}
  }else{
    res.status(400).send({
      success:false,
      msg:"provide valid req.body"
    })
  }
}
