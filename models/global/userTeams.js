
module.exports = (sequelize,Sequelize) => {
    const userTeams = sequelize.define("userTeams", {
        id:{
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        userId:{
            onDelete: "CASCADE",
            type:Sequelize.UUID,
            references:{
                model:'users',
                key:'id'
            }
        },
        teams:{
            type:Sequelize.JSON,
            defaultValue:{}
        },
       },{
        timestamps: true
       });
    return userTeams;
}