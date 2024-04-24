const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const community = sequelize.define("community", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        userId:{
            onDelete: "CASCADE",
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        },
        friendId:{
            type:Sequelize.JSON,
            allowNull:true ,
            defaultValue:{}
        }
       },{
        timestamps: true
       });
    return community;
}