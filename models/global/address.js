module.exports = (sequelize,Sequelize) => {
    const addresses = sequelize.define("addresses", {
        id:{
            type:Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        name:{
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
        houseNo:{
            type:Sequelize.STRING,
            allowNull:false
        },
        area:{
            type:Sequelize.STRING,
            allowNull:false
        },
        pincode:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('pincode');
                return rv ? parseInt(rv) : null;
              },
            allowNull:false,
            defaultValue:0
        },
        city:{
            type:Sequelize.STRING,
            allowNull:false
        },
        subCity:{
            type:Sequelize.STRING,
            allowNull:false
        },
        stateId:{
            type:Sequelize.SMALLINT,
            allowNull:false,
            references:{
                model:'states',
                key:'id'
            }
        },
        nearByLocation:{
            type:Sequelize.STRING,
            allowNull:true
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        description:{
            type: Sequelize.STRING,
            allowNull: true
        }
       },{
        timestamps: true
       });
    return addresses;
}