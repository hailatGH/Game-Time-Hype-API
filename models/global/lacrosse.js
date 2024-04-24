const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const lacrosse = sequelize.define("lacrosse", {
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
        goals:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        minutesPlayed:{
            type:Sequelize.INTEGER,
            allowNull:false,
            defaultValue:0
        },
        groundBalls:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        causedTurnover:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        blockedShot:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        shotsOnGoals:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        handedGoal:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        clear:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        turnOver:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        faceOffsWon:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        faceOffsLoss:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        penaltyMinutes:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        fouls:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        gameWinningGoals:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        saves:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        shutouts:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        goalsAllowed:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        matchStatus:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        assists:{
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
    return lacrosse;
}