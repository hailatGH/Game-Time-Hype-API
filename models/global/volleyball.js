const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const volleyballs = sequelize.define("volleyballs", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        gameName:{
            type:Sequelize.STRING,
            allowNull:false
        },
        blockSolo:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        blockingAssists:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        assists:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        handlingErrors:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        dig:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        kills:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        serviceAce:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        setsPlayed:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        pointsScored:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        Tackles:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        hittingAverage:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        totalAttempts:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        matchStatus:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        score:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0 
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        date:{
            type:Sequelize.DATEONLY,
            allowNull:false
        }
       },{
        timestamps: true
       });
    return volleyballs;
}