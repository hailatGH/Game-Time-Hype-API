module.exports = (sequelize,Sequelize) => {
    const audioTracks = sequelize.define("audioTracks", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        thumbnail:{
            type:Sequelize.STRING,
            allowNull:false
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false
        },
        artist:{
            type:Sequelize.STRING,
            allowNull:false
        },
        item:{
            type:Sequelize.STRING,
            allowNull:false
        },
        category:{
            type:Sequelize.SMALLINT,
            allowNull:false
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
    return audioTracks;
}