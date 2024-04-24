module.exports = (sequelize,Sequelize) => {
    const sports = sequelize.define("sports", {
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
    return sports;
}