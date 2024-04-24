module.exports = (sequelize, Sequelize) => {
  const blocklists = sequelize.define(
    "blocklists",
    {
      id: {
        type: Sequelize.UUID,
        primaryKey: true,
        defaultValue: Sequelize.UUIDV4,
        validate: {
          isUUID: 4,
        },
      },
      userId: {
        type: Sequelize.UUID,
        references: {
          model: "users",
          key: "id",
        },
        validate: {
          notEmpty: true,
        },
      },
      blockedUserId: {
        type: Sequelize.UUID,
        references: {
          model: "users",
          key: "id",
        },
        validate: {
          notEmpty: true,
        },
      },
    },
    {
      uniqueKeys: {
        fromto_unique: {
          fields: ["userId", "blockedUserId"],
        },
      },
    }
  );

  return blocklists;
};
