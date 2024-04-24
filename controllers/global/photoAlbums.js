const db = require("../../models");
const validate = require("../../validation");
const fs = require("fs");
const removeFile = require("./removeFile");
  
exports.create = (req, res) => {
  let array = new Object();
  req.files.map((x) => {
    array[x.filename] = x.filename;
  });
  if (Object.keys(array).length > 0) {
    db.photoalbums
      .create({
        name: req.body.name,
        items: array,
        userId: req.token.id,
      })
      .then((data) => {
        res.status(200).send(data);
      })
      .catch((err) => {
        res.status(400).send("error occured while inserting data");
      });
  } else {
    res.status(400).send("pass some images");
  }
};

exports.getAll = (req, res) => {
  db.photoalbums.findAll({where:{userId:req.token.id},order:[['createdAt','DESC']]}).then((data) => {
    res.status(200).send({
      success: true,
      data,
    });
  });
};

exports.deletePhotos = (req, res) => {
    db.photoalbums
    .findOne({ where: { id: req.body.id } })
    .then(async (data) => {
      if (!data) {
        res.status(400).send({
          success: false,
          message: "please pass valid id of Album in body",
        });
      } else{
        let photos = new Object();
        photos = data.items;
        let path;
        let deletedPhotos = req.body.deleteditems;
        deletedPhotos.forEach(x=>{
            delete photos[x];
            removeFile(x);
        })
        await db.photoalbums.update({items:photos},{where:{id:req.body.id}}).then(data=>{
            if(!data){
                res.status(400).send({
                    success: false,
                    message: "some error occured while deleting photos from DB",
                  }); 
            }else{
                res.status(200).send({
                    success: true,
                    message: "Record has been updated successfully.",
                  }); 
            }
        })
      }
    })
};

exports.deleteAlbum = (req, res) => {
  db.photoalbums
    .findOne({ where: { id: req.body.id } })
    .then(async (data) => {
      if (!data) {
        res.status(400).send({
          success: false,
          message: "please pass valid id of Album in body",
        });
      } else {
        let album = new Object();
        album = data.items;
        let path;
        if (Object.keys.length > 0) {
          Object.keys(album).forEach((x) => {
            removeFile(x);
          });
        }
        await db.photoalbums.destroy({where:{id:req.body.id}}).then(data => {
            if(data==0){
                res.status(400).send({
                    success:false,
                    message:"some error has been occured while deleting Albums."
                })
            }else{
                res.status(200).send({
                    success:true,
                    message:"Album has been successfully deleted."
                })
            }
        })
      }
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "please pass valid id of Album in body",
      });
    });
};


