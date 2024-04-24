module.exports = (sequelize,Sequelize) => {
    const motivationalClips = sequelize.define("motivationalClips", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        title:{
            type:Sequelize.STRING,
            allowNull:false
        },
        videoId:{
            type:Sequelize.STRING,
            allowNull:false
        },
        thumbnailId:{
            type:Sequelize.STRING,
            allowNull:false
        },
        userId:{
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        },
        likeCount:{
            type:Sequelize.INTEGER,
            defaultValue:0
        }
       },{
        timestamps: true
       });
    return motivationalClips;
}