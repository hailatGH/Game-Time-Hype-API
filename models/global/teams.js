const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const teams = sequelize.define("teams", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        teamProfile:{
            type:Sequelize.STRING,
            allowNull:true
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false
        },
        description:{
            type:Sequelize.STRING,
            allowNull:true
        },
        link:{
            type:Sequelize.STRING,
            allowNull:true
        },
        members:{
            type:Sequelize.JSON,
            allowNull:true ,
            defaultValue:{}
        },
        creatorId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return teams;
}