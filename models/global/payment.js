module.exports = (sequelize,Sequelize) => {
    const payment = sequelize.define("payment", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        stripeId:{
            type:Sequelize.STRING,
            allowNull:true
        },
        paymentMethod:{
            type:Sequelize.STRING,
            allowNull:false
        },
        amount:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('amount');
                return rv ? parseInt(rv) : null;
              },
            allowNull:false
        },
        status:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            defaultValue:1
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return payment;
}