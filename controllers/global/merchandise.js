const { Op } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");
const fs = require("fs");
const removeFile = require("./removeFile")

exports.create = (req, res) => {
  if(req.body.discountPercentage < 0 || req.body.discountPercentage > 100){
    removeFile(x.files.thumbnail);
    req.files.media.map(x=> removeFile(x.filename));
    return res.status(400).send({
      success:false,
      message:"please provide valid percentage"
    })
  }
    let discountPercentage = req.body.discountPercentage
    ? req.body.discountPercentage
    : 0;
    var discountedPrice
  if(discountPercentage === 0){
      discountedPrice = req.body.basePrice
  }else{
    let discountedAmount = (req.body.basePrice / 100) * discountPercentage;
    discountedPrice = req.body.basePrice - discountedAmount;
  }

  let array = new Object();
  req.files.media.map((x) => {
    array[x.filename] = x.filename;
  });
  if (Object.keys(array).length > 0) {
    db.merchandise
      .create({
        name: req.body.name,
        description: req.body.description,
        thumbnail: req.files.thumbnail[0].filename,
        media:array,
        basePrice: req.body.basePrice,
        discountPercentage: discountPercentage,
        discountedPrice: Math.ceil(discountedPrice),
        quantity: req.body.quantity,
        avlQuantity: req.body.quantity,
        categoryId: req.body.categories,
        hasSizeAvailable:req.body.hasSizeAvailable,
        status: req.body.status,
        hasSizeAvailable:req.body.hasSizeAvailable,
        s:(req.body.hasSizeAvailable == "true") ? req.body.s : 0 ,
        m:(req.body.hasSizeAvailable == "true") ? req.body.m : 0 ,
        l:(req.body.hasSizeAvailable == "true") ? req.body.l : 0 ,
        xl:(req.body.hasSizeAvailable == "true") ? req.body.xl : 0 ,
        xxl:(req.body.hasSizeAvailable == "true") ? req.body.xxl : 0 ,
      })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "record has been inserted successfully",
          data,
        });
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "some error occured while inserting record.",
        });
      });
  }
};

exports.getAllAdmin = (req, res) => {
  let { page, limit } = req.query;
  db.merchandise
    .findAll({ 
      include:[
        {model:db.categories,attributes:['id','name','parentId']},
      ],
      where:{isDeleted:false},
      limit:limit ? limit :0,
      offset:(limit*(page)),
      order:[["createdAt","Desc"]]
    })
    .then(async(data) => {
      let count =await db.sequelize.query(`select count(*)as count from "merchandises" where "isDeleted"=false`,{QueryTypes:"SELECT"})
      count = parseInt(count[0][0].count);
      res.status(200).send({
        success: true,
        message: "Records has been fetched successfully",
        count,
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching data.",
      });
    });
};

exports.getAll = (req,res) => {
  let page = req.params.page
  let categoryId = req.params.id;
  if(page && categoryId){
    db.merchandise
  .findAll({ 
    include:[
      {model:db.categories,attributes:['id','name']}
    ],
    where:{status:true,categoryId:categoryId,isDeleted:false},
    limit:15,
    offset:page*15,
    attributes:['id','name','thumbnail','discountedPrice','status','categoryId']
  })
  .then((data) => {
    res.status(200).send({
      success: true,
      message: "Records has been fetched successfully",
      data,
    });
  })
  .catch((err) => {
    res.status(400).send({
      success: false,
      message: "some error has been occured while fetching data.",
    });
  });
  }else{
    res.status(400).send({
      success:false,
      message:"please provide valid categoryId and page in the params."
    })
  }
  
}

exports.getById = (req,res) => {
    let id = req.body.id;
    db.merchandise.findOne({
      where:{id:id,status:true},
      attributes:{exclude:['thumbnail','basePrice','discountPercentage','quantity','categoryId','createdAt','updatedAt']}
    }).then((data) => {
      if(!data){
        res.status(200).send({
          success: false,
          message: "Product has been removed",
        });  
      }else{
        res.status(200).send({
          success: true,
          message: "Records has been fetched successfully",
          data,
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching data.",
      });
    });
}

exports.update = (req,res) => { 
  let id = req.body.id;
  delete req.body.id;
  var oldBasePrice,oldDiscountPercentage,temp,oldThumbnail,oldMedia;
  if('discountPercentage' in req.body){
      if(Number(req.body.discountPercentage) < 0 ||Number(req.body.discountPercentage) >100){
        return res.status(400).send({
          success:false,
          message:"Provide percentage between 0 and 100"
        })
      }
  }
  db.merchandise.findOne({where:{id:id}}).then(data=>{
    if(Object.keys(data).length > 0){
      oldBasePrice = data.dataValues.basePrice;
      oldDiscountPercentage = data.dataValues.discountPercentage;
      oldThumbnail = data.dataValues.thumbnail;
      oldMedia = data.dataValues.media;
      if('basePrice' in req.body){
        if('discountPercentage' in req.body){
            temp = (100-Number(req.body.discountPercentage));
            temp ? temp : 1
            let discountedAmount = (req.body.basePrice * temp)/100
            db.merchandise.update({basePrice:req.body.basePrice,discountPercentage:req.body.discountPercentage,discountedPrice:parseInt(discountedAmount)},{where:{id:id}}).then(data=>{
              delete req.body.basePrice;
              delete req.body.discountPercentage;
        })
        }else{
          temp = (100-Number(oldDiscountPercentage));
          temp ? temp : 1
          let discountedAmount = (req.body.basePrice * temp)/100
          db.merchandise.update({basePrice:req.body.basePrice,discountedPrice:parseInt(discountedAmount)},{where:{id:id}}).then(data=>{
            delete req.body.basePrice;
        })
      }}else if('discountPercentage' in req.body){
        temp = (100-Number(req.body.discountPercentage));
        temp ? temp : 1
        let discountedAmount = (oldBasePrice * temp)/100
        db.merchandise.update({discountPercentage:req.body.discountPercentage,discountedPrice:parseInt(discountedAmount)},{where:{id:id}}).then(data=>{
          delete req.body.discountPercentage;
      })
    }
    if(req.files.thumbnail){
        removeFile(oldThumbnail)
        req.body.thumbnail=req.files.thumbnail[0].filename
    }
    if('deletedMedia' in req.body){
      let deletedPhotos = req.body.deletedMedia;
      if(Array.isArray(deletedPhotos)&& deletedPhotos.length > 0){
        deletedPhotos.forEach(x=>{
          delete oldMedia[x];
          removeFile(x)
    })
      }else{
        removeFile(deletedPhotos)
        delete oldMedia[deletedPhotos];
      }
    db.merchandise.update({media:oldMedia},{where:{id:id}}).then(data=>{})
      delete req.body.deletedMedia;
  }
    if(req.files.media){
      let array = new Object();
      req.files.media.map((x) => {
        array[x.filename] = x.filename;
      });
      let obj = Object.assign(oldMedia,array);
        db.merchandise.update({media:obj},{where:{id:id}}).then(data=>{
        delete req.body.media
      })
    }
    if(req.body.hasSizeAvailable == "false")
    {
      db.merchandise.update({hasSizeAvailable:false,s:0,m:0,l:0,xl:0,xxl:0},{where:{id:id}}).then(data => {})  
    }
    if(parseInt(req.body.addQuantity)){
      if(parseInt(req.body.addQuantity)){
        req.body.avlQuantity=data.dataValues.avlQuantity+parseInt(req.body.addQuantity)
        req.body.quantity=data.dataValues.quantity+parseInt(req.body.addQuantity)
      }
      req?.body?.addS ?req.body.s = data.dataValues.s+parseInt(req.body.addS):""
      req?.body?.addM ?req.body.m = data.dataValues.m+parseInt(req.body.addM) :""
      req?.body?.addL ? req.body.l = data.dataValues.l+parseInt(req.body.addL):""
      req?.body?.addXL ? req.body.xl = data.dataValues.xl+parseInt(req.body.addXL):""
      req?.body?.addXXL ? req.body.xxl = data.dataValues.xxl+parseInt(req.body.addXXL):""
    }
    db.merchandise.update({...req.body},{where:{id:id}}).then(data => {
      res.status(200).send({
        success:true,
        message:"records has been updated successfully"
      })
    })
    }else{
      res.status(400).send({
        success:false,
        message:"NO record has been found in DB on this Id."
      })
    }
  }).catch(err => {
    res.status(400).send({
      success:false,
      message:"please provide valid Id.",
      err:err.message
    })
  })
}

exports.deleteMerchandise = (req,res) => {
    db.merchandise.findOne({where:{id:req.params.id}}).then(data=>{
      removeFile(data.dataValues.thumbnail)
      Object.values(data.dataValues.media).map(x=>removeFile(x))
      db.merchandise.destroy({where:{id:data.dataValues.id}}).then(data=>{
        if(data){
          res.status(200).send({
            success:true,
            message:"Record has been deleted successfully."
          })
        }
      })
    })
}

exports.getLatest = (req,res) => {
  db.merchandise
.findAll({ 
  include:[
    {model:db.categories,attributes:['id','name']}
  ],
  where:{status:true,isDeleted:false},
  limit:4,
  attributes:['id','name','thumbnail','discountedPrice','status']
})
.then((data) => {
  res.status(200).send({
    success: true,
    message: "Records has been fetched successfully",
    data,
  });
})
.catch((err) => {
  res.status(400).send({
    success: false,
    message: "some error has been occured while fetching data.",
  });
});
}