
module.exports = (sequelize,Sequelize) => {
    const usergroupdetails = sequelize.define("usergroupdetails", {
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
        groupList:{
            type:Sequelize.JSON,
            defaultValue:{}
        },
       },{
        timestamps: true
       });
    return usergroupdetails;
}