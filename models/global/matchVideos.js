module.exports = (sequelize, Sequelize) => {
  const matchVideos = sequelize.define(
    "matchVideos",
    {
      id: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        allowNull: false,
        primaryKey: true,
      },
      videoId: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      thumbnailId: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      title: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      creatorId: {
        type: Sequelize.UUID,
        onDelete: "CASCADE",
        references: {
          model: "users",
          key: "id",
        },
      },
      teamId: {
        type: Sequelize.UUID,
        onDelete: "CASCADE",
        references: {
          model: "teams",
          key: "id",
        },
      },
      date: {
        type: Sequelize.DATEONLY,
        allowNull: false,
      },
    },
    {
      timestamps: true,
    }
  );
  return matchVideos;
};
