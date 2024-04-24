const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const gamePractises = sequelize.define("gamePractises", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        date:{
            type:Sequelize.DATEONLY,
            allowNull:false
        },
        practiseTime:{
            type:Sequelize.DataTypes.DECIMAL(10,2),
            allowNull:false
        },
        notes:{
            type:Sequelize.STRING,
            allowNull:true
        },
        userId:{
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
    return gamePractises;
}