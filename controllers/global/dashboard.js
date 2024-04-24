const { Op, where } = require("sequelize");
const { sequelize } = require("../../models");
const db = require("../../models");
const validate = require("../../validation");

exports.getData = async(req,res) =>{
  let { count, rows } = await db.users
  .findAndCountAll({ 
    where:{
      roleId: { [Op.in]: ['1','2','3'] },
    },
    include: [
      {
        model: db.sports,
        attributes:['name']
      },{
        model: db.userPermissions
      }
    ],
    order:[['createdAt','DESC']],
    attributes: { exclude: ["password", "otp", "otpvalid"]},
    limit: 5,
    offset:0,
})
let totalMerchandise = await db.merchandise.count({
  where:{status:true,isDeleted:false}
})
let totalOrder = await db.order.count({})
let merchandiseSaleAmount = await db.order.findAll({
  attributes:[sequelize.fn("SUM",sequelize.col("TotalAmount"))],
  raw:true
})
let salesOrders = await db.order.findAll({
  order:[['createdAt','DESC']],
  include: [
      { model: db.users, attributes: ["id", "fullname", "profileImagePath"] }
  ],
  limit: 5,
  offset: 0,
})
res.status(200).send({
  success:true,
  message:"Record has been fetched successfully.",
  data:{
    userCount:count,
    users:rows,
    totalMerchandise,
    totalOrder,
    merchandiseSaleAmount:merchandiseSaleAmount[0].sum,
    salesOrders
  }
})
}