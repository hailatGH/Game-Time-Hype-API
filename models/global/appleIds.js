module.exports = (sequelize,Sequelize) => {
    const appleIds = sequelize.define("appleIds", {
        id:{
            type:Sequelize.STRING,
            primaryKey:true,
        },
        firstName: {
            type:Sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:true
            }
        },
        lastName: {
            type:Sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:true
            }
        },
        email:{
            type:Sequelize.STRING,
            allowNull:false
        }
    },{
        freezeTableName: true,
        timestamps: true
    });

    return appleIds;
}