module.exports = (sequelize,Sequelize) => {
    const states = sequelize.define("states", {
        id:{
            type:Sequelize.SMALLINT,
            autoIncrement: true,
            primaryKey:true
        },
        name:{
            type:Sequelize.STRING,
            allowNull:false
        },
        abbreviation:{
            type:Sequelize.STRING,
            allowNull:false
        }
       },{
        timestamps: true
       });
    return states;
}