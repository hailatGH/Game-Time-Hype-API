const { Sequelize, Op, json, QueryTypes, where } = require("sequelize");
const db = require("../../models");
const sendNotification = require("../../sendNotification");
const validate = require("../../validation");

db.getLatestMessages.belongsTo(db.users, {
  foreignKey: "senderId",
  as: "sender",
});
// db.getLatestMessages.belongsTo(db.users,{foreignKey:"userId",as:"users"})
db.getLatestMessages.belongsTo(db.users);
db.getLatestMessages.belongsTo(db.messages);
db.getLatestMessages.belongsTo(db.groups);

const getFcms = async (userId) => {
  let fcms = await db.fcms.findAll({
    where: { userId: userId },
    attributes: ["fcmToken"],
  });
  fcms = fcms.map((x) => {
    return x.dataValues.fcmToken;
  });
  return fcms;
};

const updateLatestMessages = async (data) => {
  if (data.dataValues.userId) {
    db.getLatestMessages.destroy({
      where: {
        [Op.or]: [
          {
            userId: data.dataValues.userId,
            senderId: data.dataValues.senderId,
          },
          {
            userId: data.dataValues.senderId,
            senderId: data.dataValues.userId,
          },
        ],
      },
    });
    db.getLatestMessages.create({
      userId: data.dataValues.userId,
      senderId: data.dataValues.senderId,
      messageId: data.dataValues.id,
    });
  } else if (data.dataValues.groupId) {
    db.getLatestMessages.destroy({
      where: {
        groupId: data.dataValues.groupId,
      },
    });
    db.getLatestMessages.create({
      senderId: data.dataValues.senderId,
      messageId: data.dataValues.id,
      groupId: data.dataValues.groupId,
    });
  }
};

exports.getData = async ({ socket }) => {
  let userGroups;
  await db.usergroupdetails
    .findOne({ where: { userId: socket.id } })
    .then(async (data1) => {
      if (data1) {
        userGroups = Object.keys(data1.dataValues.groupList);
      }
    });
  await db.getLatestMessages
    .findAll({
      include: [
        {
          model: db.users,
          include: [
            {
              required: false,
              model: db.blocklist,
              where: { blockedUserId: socket.id,userId: db.sequelize.literal(`"getLatestMessage"."senderId" = "user->blocklists"."userId"`) },
            },
          ],
          attributes: ["id", "fullname", "profileImagePath"],
        },
        { model: db.groups, attributes: ["id", "name", "profileImage"] },
        {
          model: db.users,
          as: "sender",
          include: [
            {
              required: false,
              model: db.blocklist,
              where: { userId: socket.id, blockedUserId: db.sequelize.literal(`"sender->blocklists"."blockedUserId" = "getLatestMessage"."userId"`) },
            },
          ],
          attributes: ["id", "fullname", "profileImagePath"],
        },
        {
          model: db.messages,
          attributes: [
            "id",
            "message",
            "senderId",
            "hasRead",
            "hasReads",
            "createdAt",
          ],
        },
      ],
      where: {
        [Op.or]: [
          { senderId: socket.id },
          { userId: socket.id },
          userGroups ? { groupId: userGroups } : "",
        ],
      },
      order: [["createdAt", "DESC"]],
      limit: 15,
      offset: 0,
    })
    .then(async (data) => {
      if (data.length && userGroups) {
        let groupAvailable = await db.getLatestMessages.findAll({
          where: {
            [Op.or]: [
              { senderId: socket.id },
              { userId: socket.id },
              { groupId: userGroups },
            ],
          },
          attributes: ["groupId"],
        });
        let userGroupsAvailable;
        userGroupsAvailable = groupAvailable?.map((x) => {
          if (
            x.dataValues.groupId != null &&
            x.dataValues.groupId != undefined
          ) {
            return x.dataValues.groupId;
          }
        });
        if (userGroupsAvailable.length) {
          userGroupsAvailable.forEach((x) => {
            if (x !== undefined && x !== null) {
              let index = userGroups.indexOf(x);
              userGroups.splice(index, 1);
            }
          });
          let remainingGroups = await db.groups.findAll({
            where: { id: userGroups },
            attributes: [
              "id",
              "name",
              "creatorId",
              "profileImage",
              "createdAt",
            ],
          });
          await socket.emit("getMessage", { data, remainingGroups });
        } else await socket.emit("getMessage", { data });
      } else if (data?.length) {
        await socket.emit("getMessage", { data });
      } else if (userGroups?.length) {
        let remainingGroups = await db.groups.findAll({
          where: { id: userGroups },
          attributes: ["id", "name", "creatorId", "profileImage", "createdAt"],
        });
        await socket.emit("getMessage", { remainingGroups });
      } else {
        await socket.emit("getMessage", { data: [] });
      }
    })
    .catch((e) => {
      console.error(e)
      socket.emit("getMessage", e);
    });
};

exports.insertData = ({ socket, arg, onlineUsers, defaultApp }) => {
  socket.emit("create", onlineUsers);
  if (Array.isArray(arg)) {
    db.messages
      .bulkCreate(
        arg.map((x) => {
          x.senderId = socket.token.id;
          return x;
        })
      )
      .then((data) => {
        newNamespace.emit("responseInsertMessages", {
          success: true,
          message: "records has been inserted",
          data,
        });
      })
      .catch((err) => {
        newNamespace.emit("responseInsertMessages", {
          success: false,
          message: "some error occured",
          err,
        });
      });
  } else {
    db.messages
      .create({ ...arg, senderId: socket.token.id })
      .then(async (data) => {
        let sender = await db.users.findOne({
          where: { id: data.dataValues.senderId },
          attributes: ["id", "fullname", "profileImagePath"],
        });
        sender = sender.get();
        updateLatestMessages(data);
        if (data && arg.userId) {
          let dataSend = { ...data.dataValues, sender };
          let sendersId = `${dataSend.senderId}`;
          let message = `${dataSend.message}`;
          let fullname = `${dataSend.sender.fullname}`;
          let profileImagePath = `${dataSend.sender.profileImagePath}`;
          let fcms = await getFcms(arg.userId);
          if (fcms.length > 0)
            sendNotification(defaultApp, fcms, {
              sendersId,
              message,
              fullname,
              profileImagePath,
            });
          if (onlineUsers[arg.userId]) {
            socket
              .to(onlineUsers[arg.userId].socketId)
              .emit("receivedMessage", dataSend);
          }
        } else if (data && arg.groupId) {
          db.groups
            .findOne({
              where: { id: arg.groupId },
              attributes: [
                "userList",
                "creatorId",
                "name",
                "profileImage",
                "id",
              ],
            })
            .then(async (data1) => {
              if (data1 && Object.keys(data1.dataValues.userList).length) {
                delete data1.dataValues.userList[socket.token.id];
                let senderUsers = Object.keys(data1.dataValues.userList);
                let fcms = await getFcms(senderUsers);
                if (fcms.length > 0) {
                  let sendersId = `${sender.id}`;
                  let message = `${data.message}`;
                  let fullname = `${sender.fullname}`;
                  let groupId = `${data1.dataValues.id}`;
                  let groupName = `${data1.dataValues.name}`;
                  let groupProfileImage = `${data1.dataValues.profileImage}`;
                  sendNotification(defaultApp, fcms, {
                    sendersId,
                    message,
                    fullname,
                    groupId,
                    groupName,
                    groupProfileImage,
                  });
                }
                senderUsers.map(async (x) => {
                  if (onlineUsers[x])
                    await socket
                      .to(onlineUsers[x].socketId)
                      .emit("receivedMessage", { ...data.dataValues, sender });
                });
              }
            });
        }
      })
      .catch((err) => {});
  }
};
