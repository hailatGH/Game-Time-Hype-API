module.exports = (sequelize,Sequelize) => {
    const refund = sequelize.define("refund", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        amount:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('amount');
                return rv ? parseInt(rv) : null;
              },
            allowNull:false
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        paymentId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'payments',
                key:'id'
            }
        },
        orderId:{
            type:Sequelize.UUID,
            allowNull:true,
            onDelete: "CASCADE",
            references:{
                model:'orders',
                key:'id'
            }
        },
        isRefunded:{
            type:Sequelize.BOOLEAN,
            allowNull:false,
            defaultValue:false
        }
       },{
        timestamps: true
       });
    return refund;
}