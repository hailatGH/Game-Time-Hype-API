const { Op, where } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");

db.messages.belongsTo(db.users, {
    foreignKey: "senderId",
    as: "sender",
});
db.messages.belongsTo(db.users);
db.messages.belongsTo(db.groups);
exports.getAll = (req, res) => {
    let page = parseInt(req.params.page)
    if (req.body.userId) {

        db.messages.findAll({
            include: [
                {
                    model: db.users,
                    as: "sender",
                    include: [
                        {
                            required: false,
                            model: db.blocklist,
                            where: { userId: req.token.id, blockedUserId: db.sequelize.literal(`"sender->blocklists"."blockedUserId" = "messages"."userId"`) },
                        },
                    ],
                    attributes: ["id", "fullname", "profileImagePath"],
                },
            ],
            where: {
                [Op.or]: [
                    {
                        userId: req.token.id,
                        senderId: req.body.userId,
                    },
                    {
                        userId: req.body.userId,
                        senderId: req.token.id,
                    },
                ],
            },
            limit: 15,
            offset: page * 15,
            order: [["createdAt", "DESC"]]
        }).then(async (data) => {
            if (data) {
                let findUser = await db.blocklist.findOne({
                    where: {
                        [Op.or]: [
                            {
                                userId: req.token.id,
                                blockedUserId: req.body.userId,
                            },
                            {
                                userId: req.body.userId,
                                blockedUserId: req.token.id,
                            },
                        ],
                    }
                })
                let hasBlock = false;
                if (findUser) {
                    hasBlock = true;
                }
                res.status(200).send({
                    hasBlock,
                    success: true,
                    messages: "Records has been fetched successfullly.",
                    data
                })
            } else {
                res.status(400).send({
                    success: false,
                    messages: "No Record found",
                })
            }
        }).catch(err => {
        })
    } else if (req.body.groupId) {
        db.messages.findAll({
            where: { groupId: req.body.groupId },
            include: [
                {
                    model: db.users,
                    as: "sender",
                    attributes: ["id", "fullname", "profileImagePath"],
                },
            ],
            limit: 15,
            offset: page * 15,
            order: [["createdAt", "DESC"]]
        }).then(data => {
            data = data.map(x => {
                x.dataValues.sender.dataValues.blocklist = [];
                return x;
            });
            if (data) {
                res.status(200).send({
                    success: true,
                    hasBlock: false,
                    messages: "Group messages has been fetched successfully.",
                    data
                })
            }
        })
    } else {
        res.status(400).send({
            success: false,
            message: "please provide valid groupId or userId"
        })
    }
}

exports.seen = async (req, res) => {
    if (req.body.groupId && req.body.messageId) {
        db.messages.findOne({ where: { id: req.body.messageId, groupId: req.body.groupId } }).then(data => {
            if (data) {
                db.messages.update({ hasReads: { ...data.dataValues.hasReads, [req.token.id]: req.token.id } }, { where: { id: req.body.messageId, groupId: req.body.groupId } })
                    .then(data => {
                        if (data) {
                            res.status(200).send({
                                success: true,
                                message: "Message has been read successfully."
                            })
                        } else {
                            res.status(400).send({
                                success: false,
                                message: "Message has not read successfully."
                            })
                        }
                    }).catch(err => {
                        res.status(400).send({
                            success: false,
                            message: "Some error has been occured while updating record"
                        })
                    })
            } else {
                res.status(400).send({
                    success: false,
                    message: "Record Not found in DB", data
                })
            }
        })
    } else if (req.body.messageId) {
        await db.messages.update({ hasRead: 1 }, { where: { id: req.body.messageId, userId: req.token.id } })
            .then(data => {
                if (data) {
                    res.status(200).send({
                        success: true,
                        message: "Message has been read successfully."
                    })
                } else {
                    res.status(400).send({
                        success: false,
                        message: "Message has not read successfully."
                    })
                }
            }).catch(err => {
                res.status(400).send({
                    success: false,
                    message: "some error has been occured while reading message."
                })
            })
    } else {
        res.status(400).send({
            success: false,
            message: "provide valid messageId or"
        })
    }
}

exports.delete = (req, res) => {
    db.messages
        .destroy({
            where: { id: req.params.id, senderId: req.token.id },
        })
        .then((data) => {
            if (data == 0)
                res.status(400).send({
                    statusCode: 400,
                    success: false,
                    message: "message not exists",
                });
            else
                res.status(200).send({
                    message: "delete successfully",
                });
        })
        .catch((err) => {
            res.send(err);
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
            .catch((err) => { });
    }
};
exports.update = (req, res) => {
    db.messages
        .update(req.body, {
            where: { id: req.params.id },
        })
        .then((data) => {
            console.log(data[0]);
            if (!data[0])
                res.status(409).send({
                    statusCode: 409,
                    success: false,
                    message: "messages not found",
                });
            else
                res.status(200).send({
                    statusCode: 200,
                    success: true,
                    message: "messages update successfully",
                });
        })
        .catch((err) => {
            res.send({
                statusCode: 201,
                error: validate(err, res),
            });
        });
};