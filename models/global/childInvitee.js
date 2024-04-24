const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const childInvitees = sequelize.define("childInvitees", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        parentId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        emails:{
            type:DataTypes.JSON,
            allowNull:false,
            defaultValue:{}
        }
       },{
        timestamps: true
       });
    return childInvitees;
}