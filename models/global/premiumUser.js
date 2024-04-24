
module.exports = (sequelize,Sequelize) => {
    const premiumUser = sequelize.define("premiumUser", {
        userId:{
            type:Sequelize.UUID,
            primaryKey: true,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        expiryDate:{
            type:Sequelize.DATE,
            allowNull:false
        },
        transactionId:{
            type:Sequelize.STRING,
            allowNull:false
        },
        productId: {
            type:Sequelize.STRING,
            allowNull:false,
        },
       },{
        timestamps: true
       });
    return premiumUser;
}