module.exports = (sequelize,Sequelize) => {
    const playlists = sequelize.define("playlists", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false
        },
        description:{
            type:Sequelize.STRING,
            allowNull:true
        },
        items:{
            type:Sequelize.JSON,
            allowNull:true ,
            defaultValue:{}
        },
        userId:{
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return playlists;
}