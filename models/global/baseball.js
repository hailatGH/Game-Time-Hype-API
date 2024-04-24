const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const baseballs = sequelize.define("baseballs", {
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
        plateAppearances:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        singles:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        doubles:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        triples:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        homerun:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        runs:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        strikeOut:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        baseOnBalls:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        hitByPitches:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        rbi:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        stolenBases:{
            type:Sequelize.SMALLINT,
            allowNull:false,
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
            onDelete: "CASCADE",
            type:Sequelize.UUID,
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
    return baseballs;
}