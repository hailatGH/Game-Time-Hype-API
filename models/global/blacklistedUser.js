module.exports = (sequelize,Sequelize) => {
    const blacklistedUser = sequelize.define("blacklistedUser", {
        email:{
            type:Sequelize.STRING,
            primaryKey:true,
            allowNull:false
        }
    },{
        freezeTableName: true,
        timestamps: true
    });

    return blacklistedUser;
}