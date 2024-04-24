const { DataTypes } = require("sequelize");
module.exports = (sequelize, Sequelize) => {
  const getLatestMessage = sequelize.define(
    "getLatestMessage",
    {
      id: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        allowNull: false,
        primaryKey: true,
      },
      userId: {
        onDelete: "CASCADE",
        type: Sequelize.UUID,
        references: {
          model: "users",
          key: "id",
        },
      },
      senderId: {
        onDelete: "CASCADE",
        type: Sequelize.UUID,
        references: {
          model: "users",
          key: "id",
        },
        allowNull: true,
        defaultValue: null,
      },
      messageId:{
        onDelete:"CASCADE",
        type:Sequelize.UUID,
        references:{
            model:"messages",
            key:"id"
        }
      },
      groupId: {
        type: Sequelize.UUID,
        defaultValue: null,
        allowNull: true,
        onDelete: "CASCADE",
        references: {
          model: "groups",
          key: "id",
        },
      },
    },
    {
      timestamps: true,
    }
  );
  return getLatestMessage;
};
