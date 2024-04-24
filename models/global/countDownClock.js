const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const countDownClock = sequelize.define("countDownClock", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        items:{
            type:DataTypes.JSON,
            allowNull:false,
            defaultValue:[]
        }
       },{
        timestamps: true
       });
    return countDownClock;
}