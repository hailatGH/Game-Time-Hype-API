module.exports = (sequelize,Sequelize) => {
    const challenges = sequelize.define("challenges", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        videoId:{
            type:Sequelize.STRING,
            allowNull:false
        },
        thumbnailId:{
            type:Sequelize.STRING,
            allowNull:false
        },
        name:{
            type:Sequelize.STRING,
            allowNull:true
        },
        limit:{
            type:Sequelize.SMALLINT,
            allowNull:true
        },
        description:{
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
        isControversial: {
            type: Sequelize.BOOLEAN,
            defaultValue: false,
          },
        acceptedCounter:{
            type:Sequelize.SMALLINT,
            allowNull:true,
            defaultValue:0
        },
        like:{
            type:Sequelize.BIGINT,
            get() {
                const rv = this.getDataValue('like');
                return rv ? parseInt(rv) : null;
              },
            allowNull:true,
            defaultValue:0
        },
        challengeId:{
            type: Sequelize.UUID,
            allowNull: true,
            onDelete: "CASCADE",
            references: {
            model: "challenges",
            key: "id",
            }
        }
       },{
        timestamps: true
       });
    return challenges;
}