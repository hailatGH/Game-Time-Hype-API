const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const footballs = sequelize.define("footballs", {
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
        rushingYards:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        passingYards:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        receivingYards:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        kickReturns:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        sacks:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        tackles:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        blocks:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        catches:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        interception:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        fieldGoals:{
            type:Sequelize.INTEGER,
            allowNull:false,
            defaultValue:0
        },
        conversions:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        touchdowns:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        possessionTime:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        matchStatus:{
            type:Sequelize.SMALLINT,
            allowNull: true,
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
    return footballs;
}