const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const categories = sequelize.define("categories", {
        id:{
            type: Sequelize.INTEGER,
            allowNull: false,
            autoIncrement:true,
            primaryKey: true
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false,
        },
        parentId:{
            type:Sequelize.SMALLINT,
            allowNull:false,
        },
       },{
        timestamps: true
       });
    return categories;
}