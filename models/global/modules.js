const { DataTypes } = require("sequelize");
module.exports = (sequelize) =>
  sequelize.define(
    "modules",
    {
      id: {
        type: DataTypes.BIGINT,
        primaryKey: true,
        autoIncrement: true,
        get() {
          const rv = this.getDataValue('id');
          return rv ? parseInt(rv) : null;
        },
      },
      name: {
        type: DataTypes.STRING(50),
        allowNull: false,
        validate: {
          len: [2, 50],
        },
        unique: "name_moduleId",
      },
      description: {
        type: DataTypes.STRING(255),
        allowNull: true,
      },
      path: {
        type: DataTypes.STRING(100),
        allowNull: true,
      },
      moduleId: {
        type: DataTypes.BIGINT,
        onDelete: "CASCADE",
        references: {
          model: "modules",
          key: "id",
        },
        unique: "name_moduleId",
        get() {
          const rv = this.getDataValue('moduleId');
          return rv ? parseInt(rv) : null;
        },
      },
      status: {
        type: DataTypes.BOOLEAN,
        defaultValue: true,
      },
    },
    {
      timestamps: true,
    }
  );

  