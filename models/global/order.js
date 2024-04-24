module.exports = (sequelize,Sequelize) => {
    const order = sequelize.define("order", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        product:{
            type:Sequelize.JSON,
            allowNull:true ,
            defaultValue:{}
        },
        address:{
            type:Sequelize.STRING,
            allowNull:false
        },
        receiverName:{
            type:Sequelize.STRING,
            allowNull:false
        },
        phone:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('phone');
                return rv ? parseInt(rv) : null;
              },
            allowNull:false,
            defaultValue:0
        },
        shippingAmount:{
            type:Sequelize.INTEGER,
            allowNull:false,
            defaultValue:0
        },
        TotalAmount:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('TotalAmount');
                return rv ? parseInt(rv) : null;
              },
            allowNull:false,
            defaultValue:0
        },
        paymentId:{
            type:Sequelize.UUID,
            onDelete:"CASCADE",
            references:{
                model:'payments',
                key:'id'
            }
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
    return order;
}