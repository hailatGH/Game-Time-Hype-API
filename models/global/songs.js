module.exports = (sequelize,Sequelize) => {
    const songs = sequelize.define("songs", {
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
        url:{
            type:Sequelize.STRING(500),
            allowNull:true
        },
        playlistId:{
        onDelete: "CASCADE",
        type: Sequelize.UUID,
        references: {
          model: "playlists",
          key: "id",
        },
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
    return songs;
}