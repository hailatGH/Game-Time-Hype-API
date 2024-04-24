const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const tennis = sequelize.define("tennis", {
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
        aces:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        breakPoints:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        doubleFaults:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        servePercentage:{
            type:Sequelize.DataTypes.DECIMAL(10,2),
            allowNull: true,
            defaultValue:0
        },
        winnersName:{
            type:Sequelize.STRING,
            allowNull: true,
            defaultValue:0
        },
        matchTime:{
            type:Sequelize.INTEGER,
            allowNull: true,
            defaultValue:0
        },
        pointsWon:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        servicePointsWon:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        setsWon:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        receivingPointsWon:{
            type:Sequelize.SMALLINT,
            allowNull: true,
            defaultValue:0
        },
        playErrors:{
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
    return tennis;
}