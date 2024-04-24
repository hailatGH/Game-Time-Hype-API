const { DataTypes } = require("sequelize");
const db = require("../index")
module.exports = (sequelize, Sequelize) => {
    const users = sequelize.define("users", {
        id: {
            type: Sequelize.UUID,
            defaultValue: Sequelize.UUIDV4,
            allowNull: false,
            primaryKey: true
        },
        username: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notEmpty: true,
                len: [4, 10]
            },
            unique: true
        },
        fullname: {
            type: Sequelize.STRING,
            allowNull: false,
            validate: {
                notEmpty: true,
                len: [2, 30]
            }
        },
        email: {
            type: Sequelize.STRING,
            allowNull: false,
            unique: "emailId",
            validate: {
                notEmpty: true,
                isEmail: true
            }
        },
        password: {
            type: Sequelize.STRING,
            allowNull: true
        },
        signupvia: {
            type: Sequelize.INTEGER
        },
        otp: {
            type: Sequelize.INTEGER,
        },
        otpvalid: {
            type: Sequelize.DATE,
        },
        gender: {
            type: Sequelize.SMALLINT,
            allowNull: true
        },
        age: {
            type: Sequelize.INTEGER,
            allowNull: true
        },
        profileImagePath: {
            type: Sequelize.STRING,
            allowNull: true,
            get() {
                const rv = this.getDataValue('profileImagePath');
                if (rv && !rv.includes('https://'))
                    return "https://ghaapi.get-hype-app.com/api/uploads/" + rv;
                return "";
            }
        },
        sportId: {
            type: Sequelize.INTEGER,
            references: {
                model: 'sports',
                key: 'id'
            },
            defaultValue: null
        },
        roleId: {
            type: Sequelize.INTEGER,
            references: {
                model: 'roles',
                key: 'id'
            }
        },
        status: {
            type: Sequelize.BOOLEAN,
            defaultValue: false
        },
        allowLocation: {
            type: Sequelize.BOOLEAN
        },
        referralCode: {
            type: Sequelize.STRING,
            allowNull: true,
            validate: { len: [0, 11] }
        },
        university: {
            type: Sequelize.STRING,
            allowNull: true
        },
        isAdmin: {
            type: Sequelize.BOOLEAN,
            defaultValue: false
        },
        childfullname: {
            type: Sequelize.STRING,
            allowNull: true,
            validate: {
                notEmpty: true,
                len: [2, 30]
            }
        },
        childprofileimagepath: {
            type: Sequelize.STRING,
            allowNull: true,
            get() {
                const rv = this.getDataValue('childprofileImagePath');
                if (rv && !rv.includes('https://'))
                    return "https://ghaapi.get-hype-app.com/api/uploads/" + rv;
                return "";
            }
        },
        childpassword: {
            type: Sequelize.STRING,
            allowNull: true
        },
        childgender: {
            type: Sequelize.SMALLINT,
            allowNull: true
        },
        childage: {
            type: Sequelize.INTEGER,
            allowNull: true
        },
        childsportid: {
            type: Sequelize.INTEGER,
            references: {
                model: 'sports',
                key: 'id'
            },
            defaultValue: null
        },
        childuniversity: {
            type: Sequelize.STRING,
            allowNull: true
        },
    }, {
        timestamps: true
    });
    return users;
}