const { DataTypes } = require("sequelize");
module.exports = (sequelize, Sequelize) => {
  const schedules = sequelize.define(
    "schedules",
    {
      id: {
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
        allowNull: false,
        primaryKey: true,
      },
      type: {
        type: Sequelize.BOOLEAN,
        defaultValue: false,
      },
      name: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      description: {
        type: Sequelize.STRING,
        allowNull: true,
      },
      location:{
        type: Sequelize.STRING,
        allowNull: false,
      },
      date_time:{
        type: Sequelize.DATE(6),
        allowNull:false
      },
      duration:{
        type:Sequelize.TIME,
        allowNull:true
      },
      arriveEarly:{
        type:Sequelize.TIME,
        allowNull:true
      },
      teamId: {
        type: Sequelize.UUID,
        onDelete: "CASCADE",
        references: {
          model: "teams",
          key: "id",
        },
      }
    },
    {
      timestamps: true,
    }
  );
  return schedules;
};
