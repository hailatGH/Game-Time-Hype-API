const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const photoalbums = sequelize.define("photoalbums", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false
        },
        items:{
            type:DataTypes.JSON,
            allowNull:false
        },
        userId:{
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return photoalbums;
}