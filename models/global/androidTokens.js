
module.exports = (sequelize,Sequelize) => {
    const androidToken = sequelize.define("androidToken", {
        userId:{
            type:Sequelize.UUID,
            primaryKey: true,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        token:{
            type:Sequelize.STRING,
            allowNull:false
        },
        packageName:{
            type:Sequelize.STRING,
            allowNull:false
        }
       },{
        timestamps: true
       });
    return androidToken;
}