
module.exports = (sequelize, Sequelize) => {
    const groups = sequelize.define("groups", {
        id: {
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        name: {
            type: Sequelize.STRING,
            allowNull: false
        },
        creatorId: {
            onDelete: "CASCADE",
            type: Sequelize.UUID,
            references: {
                model: 'users',
                key: 'id'
            }
        },
        userList: {
            type: Sequelize.JSON,
            defaultValue: {}
        },
        profileImage: {
            type: Sequelize.STRING,
            allowNull: true,
            defaultValue: null,
            get() {
                const rv = this.getDataValue('profileImage');
                if (rv && !rv.includes('https://'))
                    return "https://ghaapi.get-hype-app.com/api/uploads/" + rv;
                return "";
            }
        }
    }, {
        timestamps: true
    });
    return groups;
}