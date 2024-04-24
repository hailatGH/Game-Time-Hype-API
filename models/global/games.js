
module.exports = (sequelize,Sequelize) => {
    const games = sequelize.define("games", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        title:{
            type:Sequelize.STRING,
            allowNull:false,
            validate:{
                notEmpty:true,
            }
        },
        playStoreLink:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        appStoreLink:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        categoryId:{
            type:Sequelize.SMALLINT,
            allowNull:false,
        },
        thumbnail:{
            type:Sequelize.STRING,
            allowNull:false,
        },
        userId:{
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        },
       },{
        timestamps: true
       });
    return games;
}