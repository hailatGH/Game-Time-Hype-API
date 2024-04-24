module.exports = (sequelize,Sequelize) => {
    const refers = sequelize.define("refers", {
        id:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('id');
                return rv ? parseInt(rv) : null;
              },
            autoIncrement: true,
            primaryKey:true
        },
        userId:{
            onDelete: "CASCADE",
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        },
        referedUser:{
            onDelete: "CASCADE",
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        },
        referralCode:{
            type:Sequelize.STRING,
            allowNull:true,
            validate: { len: [0,11] }
        }
       },{
        timestamps: true
       });
    return refers;
}









