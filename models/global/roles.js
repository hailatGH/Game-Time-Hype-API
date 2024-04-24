
module.exports = (sequelize,Sequelize) => {
    const roles = sequelize.define("roles", {
        id:{
            type:Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:true,
            }
        },
        description:{
            type:Sequelize.STRING,
            allowNull:true,
        }
       },{
        timestamps: true
       });
    return roles;
}