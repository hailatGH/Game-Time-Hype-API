module.exports = (sequelize,Sequelize) => {
    const challengesLikes = sequelize.define("challengesLikes", {
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
        items:{
            type:Sequelize.JSON,
            allowNull:true ,
            defaultValue:{}
        }
       },{
        timestamps: true
       });
    return challengesLikes;
}