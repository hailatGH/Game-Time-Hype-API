module.exports = (sequelize,Sequelize) => {
    const shippingRate = sequelize.define("shippingRate", {
        amount:{
            type:Sequelize.SMALLINT,
            defaultValue:0,
            allowNull:false
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            primaryKey: true,
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return shippingRate;
}