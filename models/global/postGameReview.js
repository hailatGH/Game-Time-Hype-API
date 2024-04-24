module.exports = (sequelize,Sequelize) => {
    const postGameReview = sequelize.define("postGameReview", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        matchVideoId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'matchVideos',
                key:'id'
            }
        },
        notes:{
            type:Sequelize.JSON,
            defaultValue:{}
        },
        ratings:{
            type:Sequelize.FLOAT,
            defaultValue:0,
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
        date:{
            type:Sequelize.DATEONLY,
            allowNull:false
        }
       },{
        timestamps: true
       });
    return postGameReview;
}