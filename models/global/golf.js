const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const golfs = sequelize.define("golfs", {
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
        golfHole:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        drivingDistance:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        drivingAccuracy:{
            type:Sequelize.DataTypes.DECIMAL(10,2),
            allowNull: false,
            defaultValue:0
        },
        carryingDistance:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        FairwaysRegulation:{
            type:Sequelize.DataTypes.DECIMAL(10,2),
            allowNull: false,
            defaultValue:0
        },
        greensRegulation:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        puttsPerRound:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        handicap:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        sandSaves:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        eagles:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        birdies:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        pars:{
            type:Sequelize.SMALLINT,
            allowNull: false,
            defaultValue:0
        },
        bogeys:{
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
    return golfs;
}