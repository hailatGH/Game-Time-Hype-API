module.exports = (sequelize,Sequelize) => {
    const parents = sequelize.define("parents", {
        id:{
            type:Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        parentId:{
            type:Sequelize.UUID,
            onDelete: "CASCADE",
            references:{
                model:'users',
                key:'id'
            }
        },
        childId:{
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
    return parents;
}