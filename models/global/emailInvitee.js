const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const emailInvitees = sequelize.define("emailInvitees", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        teamId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'teams',
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
    return emailInvitees;
}