const { reports } = require("../../models");
const db = require("../../models");
const sendNotification = require("../../sendNotification");
db.reports.belongsTo(db.challenges, {
  foreignKey: "challengeId",
  as: "ochallenges",
});
db.users.hasMany(db.reports);
db.reports.belongsTo(db.users);
db.reports.belongsTo(db.users, {
  foreignKey: "reportedUserId",
  as: "reportedUser",
});
db.challenges.belongsTo(db.challenges, {
  foreignKey: "challengeId",
  as: "challen",
});

const getFcms = async(userId) =>{
  let fcms = await db.fcms.findAll({where:{userId:userId},attributes:['fcmToken']})
  fcms =  fcms.map(x=>{
    return x.dataValues.fcmToken
  })
  return fcms
}

exports.createReport = (req, res) => {
  if (req.body.challengeId && req.body.reasonId && req.body.reportedUserId) {
    db.reports
      .create({ ...req.body, userId: req.token.id })
      .then(async (data) => {
        await db.challenges.update(
          { isControversial: true },
          { where: { id: req.body.challengeId } }
        );
        if (data) {
          let fcms = await getFcms("9e4a79d4-2b56-447c-9d42-60b0eb43a2a9")
          fcms.length ? sendNotification(req.firebase,fcms,{title:"Someone has reported a challenge. Kindly check admin panel for more details."}) : ""
          res.status(200).send({
            success: true,
            message: "Your report has been sended successfully.",
          });
        } else {
          res.status(400).send({
            success: false,
            message: "Some error occured while creating Report.",
          });
        }
      })
      .catch((err) => {
        console.log(err);
        res.status(400).send({
          success: false,
          message: "some error has been occured while creating Report.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "Provide valid challengeId,reasonId,reason,reportedUserId",
    });
  }
};

exports.getAll = (req, res) => {
  let { page, limit } = req.query;
  db.reports
    .findAll({
      attributes: [
        "challengeId",
        [
          db.sequelize.fn("COUNT", db.sequelize.col("reports.challengeId")),
          "count",
        ],
      ],
      include: [
        {
          model: db.challenges,
          as: "ochallenges",
          include: [{ model: db.challenges, as: "challen" }],
        },
      ],
      group: [
        "reports.challengeId",
        "ochallenges.id",
        "ochallenges->challen.id"
      ],
      limit: limit,
      offset: page * limit,
      order:[["challengeId","ASC"]]
    })
    .then((data) => {
      res.status(200).send({
        success: true,
        message: "data fetched successfully.",
        data,
      });
    })
    .catch((err) => {
      console.log(err);
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching records.",
      });
    });
};

exports.getById = (req, res) => {
  let challengeId = req.params.id;
  let { page, limit } = req.query;
  if (challengeId) {
    db.reports
      .findAll({
        where: { challengeId },
        attributes: [
          "id",
          "challengeId",
          "reasonId",
          "reason",
          "reportedUserId",
          "userId",
          "createdAt",
        ],
        include: [
          {
            model: db.users,
            attributes: ["id", "fullname", "profileImagePath"],
          },
          {
            model: db.users,
            attributes: ["id", "fullname", "profileImagePath"],
            as: "reportedUser",
          },
        ],
        order: [["createdAt", "DESC"]],
        limit: limit,
        offset: page * limit,
      })
      .then(async (data) => {
        if (data) {
          let count = await db.sequelize.query(
            `select count(*) as count from "reports" where "challengeId" = '${challengeId}'`,
            { QueryTypes: "SELECT" }
          );
          count = parseInt(count[0][0].count);
          res.status(200).send({
            success: true,
            count,
            message: "Records has been fetched successfully",
            data,
          });
        } else {
          res.status(200).send({
            success: true,
            message: "Records has been fetched successfully",
            data,
          });
        }
      })
      .catch((err) => {
        console.log(err);
        res.status(400).send({
          success: false,
          message: "some error has been occured while fetching records.",
        });
      });
  }
};
