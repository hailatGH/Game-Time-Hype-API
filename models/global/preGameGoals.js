module.exports = (sequelize,Sequelize) => {
    const pregamegoals = sequelize.define("pregamegoals", {
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
        subtitle:{
            type:Sequelize.STRING,
            allowNull:false
        },
        description:{
            type:Sequelize.STRING,
            allowNull:false,
            validate:{
                notNull:true,
                len: [2,512]
            }
        },
        userId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        }
       },{
        timestamps: true
       });
    return pregamegoals;
}