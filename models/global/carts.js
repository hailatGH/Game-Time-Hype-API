const {DataTypes} = require("sequelize")
module.exports = (sequelize,Sequelize) => {
    const carts = sequelize.define("carts", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        merchandiseId:{
            type:Sequelize.UUID,
            references:{
                model:'merchandises',
                key:'id'
            }
        },
        qty:{
            type:Sequelize.SMALLINT,
            allowNull:false
        },
        size:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        subTotal:{
            type:Sequelize.INTEGER,
            allowNull:true
        },
        shipping:{
            type:Sequelize.SMALLINT,
            allowNull:true
        },
        total:{
            type:Sequelize.INTEGER,
            allowNull:true
        },
       },{
        timestamps: true
       });
    return carts;
}