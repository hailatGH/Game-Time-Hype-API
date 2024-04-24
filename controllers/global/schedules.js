const db = require("../../models");

db.teams.hasMany(db.schedules)
db.schedules.belongsTo(db.teams)

exports.createSchedule = (req, res) => {
  db.schedules
    .create({ ...req.body, date_time: new Date(req.body.dateTime) })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "schedule has been created successfully.",
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while creating schedule.",
      });
    });
};

exports.getAll = async (req, res) => {
  let teams = await db.userTeams.findOne({
    where: { userId: req.token.id },
    attributes: ["teams"],
  });
  if (teams) {
    teams = Object.keys(teams.dataValues.teams);
    db.schedules
      .findAll({ where: { teamId: teams }, include:[
        {model:db.teams,attributes:['id','name']},
    ],
    order:[['date_time','Desc']]
 })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "schedules has been fetched successfully.",
          data,
        });
      })
      .catch((err) => {
        console.log(err);
        res.status(400).send({
          success: false,
          message: "some error has been occured while fetching schedules.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "No associated teams found.",
    });
  }
};

exports.getById = (req,res) =>{
    if(req.params.id){
        db.schedules.findAll({where:{teamId:req.params.id},order:[['date_time','DESC']]}).then(data=>{
            res.status(200).send({
                success:true,
                message:"all team has been fetched successfully.",
                data
            })
        }).catch(err=>{
            console.log(err);
            res.status(400).send({
                success:false,
                message:"Provide valid id."
            })
        })
    }else{
        res.status(400).send({
            success:false,
            message:"provide valid id in the params."
        })
    }
}
  
exports.updateSchedule = (req,res) => {
  if(req.body.dateTime){
    req.body.date_time=new Date(req.body.dateTime)
    delete req.body.dateTime
  }
  db.schedules.update({...req.body},{where:{id:req.params.id}}).then(data=>{
    res.status(200).send({
      success:true,
      message:"schedule has been updated successfully."
    })
  }).catch(err=>{
    console.log(err);
    res.status(400).send({
      success:false,
      message:"some error has been occured while updating schedule."
    })
  })
}

exports.deleteSchedule = (req,res) => {
  db.schedules.destroy({where:{id:req.params.id}}).then(data=>{
    res.status(200).send({
      success:true,
      message:"schedule has been deleted successfully."
    })
  }).catch(err=>{
    res.status(400).send({
      success:false,
      message:"some error has been occured while deleting schedule."
    })
  })
}