
const { Op } = require("sequelize");
const db = require("../../models");
const removeFile = require("./removeFile");

exports.getData = async(req,res) =>{
    let id = req.params.id
    if(id)
    db.groups.findOne({
        where:{id:id},
        attributes:['id','name','creatorId','userList','profileImage']
    },
        ).then(async(data)=>{
          if(!data){
            return res.status(400).send({
                success:false,
                message:"please provide valid groupId"
            })
          }
        let Group;
        data ? Group = data.get() :''
        await db.users.findAll({
            where:{
                id:Object.keys(data.dataValues.userList),
            },
            attributes:['id','fullname','profileImagePath','university']
        }).then(data=> {
            delete Group.userList
            res.status(200).send({
                success:true,
                message:"Record has been fetched.",
                Group,data
            })
        })
    }).catch(err => {
        return res.status(400).send({
            success:false,
            message:"please provide valid groupId"
        })
    })
    else{
        res.status(400).send({
            success:true,
            message:"Please provide valid Id in params"
        })
    }
}

exports.insertData = (req,res) =>{
    let deletedUserId=[];
    req.file? req.body.profileImage = req.file.filename : req.body.profileImage = null
    let obj = new Object();
    if(Array.isArray(req.body.userList) && req.body.userList.length > 0){
        req.body.userList.map(x=>{ return obj[x]=x})
    }else if(req.body.userList){
        obj[req.body.userList]=req.body.userList;
    }
    obj[req.token.id]=req.token.id;
    db.groups.create({name:req.body.name,creatorId:req.token.id,userList:{...obj},profileImage:req.body.profileImage}).then(async(data)=>{
       if(data){
        let id = data.dataValues.id; 
        data.dataValues.userList = {...data.dataValues.userList}
        let tempKeys = Object.keys(data.dataValues.userList)
        for(let i =0; i < tempKeys.length; i++) {
           await db.users.findOne({where:{id:data.dataValues.userList[tempKeys[i]]}}).then(async(data1)=>{
                if(data1){
                    await db.usergroupdetails.findOrCreate({where:{userId:data.dataValues.userList[tempKeys[i]]}}).then(async(data)=>{
                        let oldObj =data[0].dataValues.groupList
                        oldObj = {...oldObj,[id]:id}
                        db.usergroupdetails.update({groupList:oldObj},{where:{id:data[0].dataValues.id}})
                    })
                }else{
                   deletedUserId.push(data.dataValues.userList[tempKeys[i]])
                }
               })
        }
        delete data.dataValues.userList[req.token.id]
            await res.status(200).send({
                success:true,
                message:"Group has been created successfully.",
                data,
                deletedUserdata : deletedUserId
            })
       }
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error occured while creating Group."
        })
    })
}

exports.update = (req,res) => {
    db.groups.findOne({id:req.body.id}).then(data=>{
        if(!data){
            return res.status(400).send({
                success:false,
                message:"please provide valid id in the body."
            })
        }else{
            if(req.file){
                req.body.profileImage = req.file.filename
                removeFile(data.dataValues.profileImage)
            }
            let id = req.body.id;
            delete req.body.id;
            db.groups.update(req.body,{where:{id:id}}).then(data=>{
                if(data[0]){
                    res.status(200).send({
                        success:true,
                        message:"Record has been updated successfully."
                    })
                }
            })
        }
    }).catch(err=>{
        return res.status(400).send({
            success:false,
            message:"please provide valid id in the body."
        })
    })
}

exports.addUser = (req,res) =>{
    db.groups.findOne({where:{id:req.body.groupId}}).then(data=>{
        let obj = new Object(data.dataValues.userList)
        if(req.body.addUser.length > 0)
        {req.body.addUser.forEach(x => {
                obj[x]=x;
                db.usergroupdetails.findOrCreate({where:{userId:x}}).then(data=>{
                    let oldObj =data[0].dataValues.groupList
                    oldObj = {...oldObj,[req.body.groupId]:req.body.groupId}
                    db.usergroupdetails.update({groupList:oldObj},{where:{id:data[0].dataValues.id}})
                })
        })
    }
        db.groups.update({userList:obj},{where:{id:req.body.groupId}}).then(data=>{
            if(data[0]){
                res.status(200).send({
                    success:true,
                    message:"Record has been updated successfully."
                })
            }else{
                res.status(400).send({
                    success:false,
                    message:"some error has been occured while updating record."
                })
            }
        }).catch(err=>{
            res.status(400).send({
                success:false,
                message:"some error has been occured while updating record."
            })
        })
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"please provide valid groudId or userId"
        })
    })
}

exports.deleteUser = (req,res) => {
    if(req.body.groupId && req.body.deleteUserId){
        db.groups.findOne({where:{id:req.body.groupId}}).then(data=>{
            if(!data){
                return res.status(400).send({
                    success:false,
                    message:"group has been not found in the DB."
                })
            }else{
                let obj = new Object(data.dataValues.userList)
                delete obj[req.body.deleteUserId]
                db.usergroupdetails.findOrCreate({where:{userId:req.body.deleteUserId}}).then(data=>{
                    let oldObj =data[0].dataValues.groupList
                    delete oldObj[req.body.groupId];
                    db.usergroupdetails.update({groupList:oldObj},{where:{id:data[0].dataValues.id}})
                })
                db.groups.update({userList:obj},{where:{id:req.body.groupId}}).then(data=>{
                    if(data[0]){
                        res.status(200).send({
                            success:true,
                            message:"Record has been deleted from the DB."
                        })
                    }else{
                        res.status(400).send({
                            success:false,
                            message:"some error has been occured while deleting record."
                        })
                    }
                }).catch(err=> {
                    res.status(400).send({
                        success:false,
                        message:"Some error occured while deleting record."
                    })
                })
            }
            
        })
    }else{
        res.status(400).send({
            success:false,
            message:"please provide valid groupId and deleteUserId in the body."
        })
    }
}

exports.getCoachGroup = async(req,res) => {
    db.teams.findAll({where:{creatorId:req.token.id},attributes:['id','name','teamProfile']}).then(data=>{
        res.status(200).send({
            success:true,
            message:"teams has been fetched successfully.",
            data    
        })
    }).catch(err=>{
        res.status(400).send({
            success:false,
            message:"some error has been occured while fetching Teams."
        })
    })
}