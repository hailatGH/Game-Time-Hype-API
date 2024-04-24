const { DataTypes } = require("sequelize");
module.exports = (sequelize, Sequelize) => {
  const messages = sequelize.define(
    "messages",
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
      message: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      hasRead: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: false,
      },
      hasReads: {
        type: Sequelize.JSON,
        defaultValue: {},
      },
    },
    {
      timestamps: true,
    }
  );
  return messages;
};
