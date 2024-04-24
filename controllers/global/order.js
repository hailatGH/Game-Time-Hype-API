const db = require("../../models");
const validate = require("../../validation");

db.order.belongsTo(db.payment);
db.order.belongsTo(db.users);

exports.insert = async(req,res) => {
    let obj = new Object(req.body.product)
    for(const property in obj){
        let id = property;
        let value = obj[property];
            await db.merchandise.decrement(
                {...obj[property]},
                {where:{id:id}}
            )
    }
    db.order.create({...req.body,userId:req.token.id}).then(data=>{
        if(data){
            res.status(200).send({
                success:true,
                message:"Record has been inserted successfully.",
                data
            })
        }else{
            res.status(400).send({
                success:false,
                message:"some error occured while inserting record"
            })
        }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured while inserting record"
        })
    })
}

exports.getAll = async(req,res) => {
    let { page, limit } = req.query;
  const { count, rows } = await db.order.findAndCountAll({
        order:[['createdAt','DESC']],
        include: [
            { model: db.users, attributes: ["id", "fullname", "profileImagePath"] }
        ],
        limit: limit,
        offset: page * limit,
    })
    if(rows.length){
        res.status(200).send({
          success:true,
          message:"Record has been fetched successfully.",
          count,
          data:rows
        })
      }else{
        res.status(400).send({
          success:false,
          message:"No record found in db",
          count,
          data:rows
        })
      }
}

exports.getByToken = (req,res) => {
    db.order.findAll({
        include:[
            {model:db.payment,attributes:['id','paymentMethod']}
        ],
        where:{userId:req.token.id},
        order:[['createdAt','DESC']]
    }).then(async(data)=>{
        for(let i=0;i<data.length;i++){
            product = Object.keys(data[i].dataValues.product)
            if(product){
                let productData = await db.merchandise.findAll({where:{id:product}})
                productData?.map(ele=>{
                    data[i].dataValues.product[ele.dataValues.id].thumbnail=ele.dataValues.thumbnail
                })
            }
        }
        res.status(200).send({
            success:true,
            message:"Record has been fetched successfully.",
            data
        })
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching data."
        })
    })
}

exports.getById = (req,res) => {
    let id = req.params.id;
    if(id){
        db.order.findAll({
            include:[
                {model:db.payment,attributes:['id','paymentMethod']},
                {model:db.users,attributes:['email']}
            ],
            where:{id},
            order:[['createdAt','DESC']]
        }).then(async(data)=>{
            for(let i=0;i<data.length;i++){
                product = Object.keys(data[i].dataValues.product)
                if(product){
                    let productData = await db.merchandise.findAll({where:{id:product}})
                    productData?.map(ele=>{
                        data[i].dataValues.product[ele.dataValues.id].thumbnail=ele.dataValues.thumbnail
                        data[i].dataValues.product[ele.dataValues.id].name=ele.dataValues.name
                        data[i].dataValues.product[ele.dataValues.id].unitePrice=ele.dataValues.discountedPrice
                    })
                }
            }
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                data
            })
        }).catch(err=>{
            res.status(400).send({
                success:false,
                message:"some error has been occured while fetching data."
            })
        })
    }else{
        res.status(400).send({
            success:false,
            message:"Provide valid id in the params."
        })
    }
}