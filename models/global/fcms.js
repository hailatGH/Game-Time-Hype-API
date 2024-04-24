const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const fcms = sequelize.define("fcms", {
        fcmToken:{
            type:Sequelize.STRING,
            primaryKey:true
        },
        userId: {
            type:Sequelize.UUID,
            allowNull:false,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return fcms;
}


