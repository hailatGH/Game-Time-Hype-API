const db = require("../../models");
const removeFile = require("./removeFile");
const Sequelize = require('sequelize');
const { Op } = Sequelize;

exports.createTeam = (req, res) => {
  if (req.file) {
    req.body.teamProfile = req.file.filename;
  }
  if (req.body.name) {
    db.teams
      .create({
        ...req.body,
        creatorId: req.token.id,
        members: { [req.token.id]: req.token.id },
      })
      .then(async (data) => {
        let userTeams = await db.userTeams.findOrCreate({
          where: { userId: req.token.id },
        });
        if (userTeams && userTeams.length) {
          let Obj = new Object(userTeams[0].dataValues.teams);
          Obj[data.dataValues.id] = data.dataValues.id;

          await db.userTeams.update(
            { teams: Obj },
            { where: { userId: req.token.id } }
          );
        }
        res.status(200).send({
          success: true,
          message: "Team has been created successfully.",
          data,
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "provide valid Group Name in the Body.",
    });
  }
};

exports.updateTeam = async (req, res) => {
  if (req.file) {
    req.body.teamProfile = req.file.filename;
  }
  if (req.body.description === "") {
    req.body.description = null;
  }
  if (req.body.id) {
    try {
      const data = await db.teams.findOne({ where: { id: req.body.id } });
      coachId = await db.teams.findOne({ where: { id: req.body.id } });
      if (data) {
        if (req.body?.teamProfile) {
          removeFile(data.dataValues.teamProfile);
        }
        if (
          req.body.members &&
          Array.isArray(req.body.members) &&
          req.body.members.length
        ) {
          let Obj = new Object();
          for (let i = 0; i < req.body.members.length; i++) {
            let userTeams = await db.userTeams.findOrCreate({
              where: { userId: req.body.members[i] },
            });
            if (userTeams && userTeams.length) {
              let userGroups = userTeams[0].dataValues.teams;
              userGroups = {
                ...userGroups,
                [data.dataValues.id]: data.dataValues.id,
              };
              await db.userTeams.update(
                { teams: userGroups },
                { where: { userId: req.body.members[i] } }
              );
              Obj[req.body.members[i]] = req.body.members[i];
            }
          }
          req.body.members = { ...data.dataValues.members, ...Obj };
        } else if (req.body.members) {
          let userTeams = await db.userTeams.findOrCreate({
            where: { userId: req.body.members },
          });
          if (userTeams && userTeams.length) {
            let userGroups = userTeams[0].dataValues.teams;
            userGroups = {
              ...userGroups,
              [data.dataValues.id]: data.dataValues.id,
            };
            await db.userTeams
              .update(
                { teams: userGroups },
                { where: { userId: req.body.members } }
              )
              .then((data) => {
                let Obj = new Object(req.body.members);
                db.community
                  .findOrCreate({
                    where: { userId: coachId.creatorId },
                  })
                  .then((data) => {
                    let newObj = { ...data[0].dataValues.friendId, [Obj]: Obj };
                    db.community
                      .update(
                        { friendId: newObj },
                        { where: { userId: coachId.creatorId } }
                      )
                      .then((data) => {
                        if (data) {
                          console.log("\n\nrecord has been inserted.\n\n");
                        } else {
                          console.log(
                            "\n\nSome error has been thrown at inserting time.\n\n"
                          );
                        }
                      })
                      .catch((err) => console.log(`Error occured1: ${err}`));
                  })
                  .catch((err) => console.log(`Error occured2: ${err}`));
              });
          }
          req.body.members = {
            ...data.dataValues.members,
            [req.body.members]: req.body.members,
          };
        }
      } else {
        return res.status(404).send({
          success: false,
          message: "Team doesn't Found.",
        });
      }
    } catch (err) {
      console.log(err);
      res.status(400).send({
        success: false,
        message: "Some error occured while upating team.",
      });
    }

    let id = req.body.id;
    delete req.body.id;
    await db.teams
      .update({ ...req.body }, { where: { id: id } })
      .then((data) => {
        return res.status(200).send({
          success: true,
          message: "Team has been updated successfully.",
        });
      })
      .catch((err) => {
        console.log(err);
        return res.status(400).send({
          success: false,
          message: "Some error has been occured while updating team.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "Please provide valid id in the body.",
    });
  }
};

exports.getAllTeam = async (req, res) => {
  let teams = await db.userTeams.findOne({ where: { userId: req.token.id } });
  if (teams && Object.keys(teams.dataValues.teams).length) {
    let team = Object.keys(teams.dataValues.teams);
    db.teams
      .findAll({
        where: { id: team },
        attributes: { exclude: ["members", "createdAt", "updatedAt"] },
      })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "teams has been fetched successfully.",
          data,
        });
      });
  } else {
    res.status(200).send({
      success: false,
      message: "No Teams found",
    });
  }
};

exports.deleteTeam = (req, res) => {
  if (req.body.id) {
    db.teams
      .findOne({ where: { id: req.body.id } })
      .then((data) => {
        if (data) {
          removeFile(data.dataValues.teamProfile);
          db.teams
            .destroy({ where: { id: req.body.id } })
            .then((data) => {
              res.status(200).send({
                success: true,
                message: "Teams has been deleted successfully.",
              });
            })
            .catch((err) => {
              return res.status(400).send({
                success: false,
                message: "some error has been occured while deleting team",
              });
            });
        } else {
          res.status(400).send({
            success: false,
            message: "Team doesn't Found",
          });
        }
      })
      .catch((err) => {
        console.log(err);
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid id in body.",
    });
  }
};

exports.getAllMembersAcrossTeams = async (req, res) => {
  try {
    if (req.params.id) {
      let teamData = await db.teams.findAll({ where: { creatorId: req.params.id }});
      if (teamData) {
        let final_result = [];

        await Promise.all(teamData.map(async team => {
          let team_data = {};
          let members_accepted = [];
          let members_pending = [];

          team_data['team_id'] = team.id;
          team_data['team_name'] = team.name;

          let emailInvites = await db.emailInvitees.findOne({
            where: { teamId: team.id }
          });

          for (const key in emailInvites.emails) {
            const value = emailInvites.emails[key];
            if(value == "PENDING") members_pending.push(key)
            if(value == "ACCEPTED") {
              let userData = await db.users.findOne({
                where: { email: key },
                attributes: ["id", "fullname", "profileImagePath", "university", "email"]
              });
              members_accepted.push(userData);
            }
          }

          team_data['members_pending'] = members_pending;
          team_data['members_accepted'] = members_accepted;
          final_result.push(team_data);
        }));

        res.status(200).send({
          success: true,
          message: "Members have been fetched successfully.",
          data: final_result,
        });
      } else {
        res.status(400).send({
          success: false,
          message: "Team not found.",
        });
      }
    } else {
      res.status(400).send({
        success: false,
        message: "Provide id in the params.",
      });
    }
  } catch (error) {
    console.log(error);
    res.status(400).send({
      success: false,
      message: "Some error has occurred while getting members across teams.",
    });
  }
}

exports.getAllMembers = async (req, res) => {
  try {
    if (req.params.id) {
      let memberData;
      let teamData = await db.teams.findOne({ where: { id: req.params.id } });
      if (teamData) {
        let members = Object.keys(teamData.dataValues.members);
        if (members.length) {
          memberData = await db.users.findAll({
            where: { id: members },
            attributes: ["id", "fullname", "profileImagePath", "university"],
          });
          delete teamData.dataValues.members;
        }
        res.status(200).send({
          success: true,
          message: "Members has been fetched successfully.",
          data: { ...teamData.dataValues, memberData },
        });
      } else {
        res.status(400).send({
          success: false,
          message: "team not found.",
        });
      }
    } else {
      res.status(400).send({
        success: false,
        message: "provide id in the the params",
      });
    }
  } catch (error) {
    console.log(error);
    res.status(400).send({
      success: false,
      message: "some error has been occured while getting members.",
    });
  }
};

exports.removeMember = async (req, res) => {
  try {
    if (req.body.teamId && req.body.userId) {
      let teamMembers = await db.teams.findOne({
        where: { id: req.body.teamId },
        attributes: ["members"],
      });
      let Obj = new Object(teamMembers.dataValues.members);
      delete Obj[req.body.userId];
      await db.teams.update(
        { members: Obj },
        { where: { id: req.body.teamId } }
      );
      let userTeams = await db.userTeams.findOne({
        where: { userId: req.body.userId },
        attributes: ["teams"],
      });
      let objTeams = new Object(userTeams.dataValues.teams);
      delete objTeams[req.body.teamId];
      await db.userTeams.update(
        { teams: objTeams },
        { where: { userId: req.body.userId } }
      );
      res.status(200).send({
        success: true,
        message: "User has been successfully removed",
      });
    } else {
      res.status(400).send({
        success: false,
        message: "provide valid teamId and UserId in the body.",
      });
    }
  } catch (error) {
    res.status(400).send({
      success: false,
      message: "some error has been occured while removing user.",
    });
  }
};
