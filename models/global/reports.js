module.exports = (sequelize, Sequelize) => {
  const reports = sequelize.define(
    "reports",
    {
      id: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        allowNull: false,
        primaryKey: true,
      },
      challengeId: {
        type: Sequelize.UUID,
        allowNull: true,
        onDelete: "CASCADE",
        references: {
          model: "challenges",
          key: "id",
        },
      },
      reasonId: {
        type: Sequelize.SMALLINT,
        allowNull: false,
      },
      reason: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      reportedUserId: {
        type: Sequelize.UUID,
        onDelete: "CASCADE",
        references: {
          model: "users",
          key: "id",
        },
      },
      userId: {
        type: Sequelize.UUID,
        onDelete: "CASCADE",
        references: {
          model: "users",
          key: "id",
        },
      },
    },
    {
      timestamps: true,
    }
  );
  return reports;
};
