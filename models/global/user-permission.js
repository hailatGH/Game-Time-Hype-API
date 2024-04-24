module.exports = (sequelize,Sequelize) => {
    const userPermission = sequelize.define("userPermission", {
        userId:{
            type:Sequelize.UUID,
            primaryKey:true,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        modules:{
            type:Sequelize.JSON,
            allowNull:true ,
            defaultValue:{}
        }
       },{
        timestamps: true
       });
    return userPermission;
}