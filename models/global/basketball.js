const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const basketballs = sequelize.define("basketballs", {
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
        pointers2:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        pointers3:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        freeThrows:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        rebounds:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        assists:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        steals:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        blocks:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        turnover:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        fouls:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:0
        },
        matchStatus:{
            type:Sequelize.SMALLINT,
            allowNull:false,
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
    return basketballs;
}