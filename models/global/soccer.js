const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const soccers = sequelize.define("soccers", {
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
        goalsScored:{
            type:Sequelize.INTEGER,
            allowNull: true,
            defaultValue:0
        },
        assists:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        shotsToGoal:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        timeOfPosition:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        fouls:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        offsides:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        touches:{
            type:Sequelize.INTEGER,
            allowNull: true,
            defaultValue:0
        },
        turnover:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        freeKick:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        goalKick:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        panaltyKick:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        cornerKick:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        passes:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        matchStatus:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        blockedGoals:{
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
    return soccers;
}