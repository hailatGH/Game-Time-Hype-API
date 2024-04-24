module.exports = (sequelize,Sequelize) => {
    const googleAds = sequelize.define("googleAds", {
        id:{
            type:Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        appOpen:{
            type:Sequelize.STRING,
            allowNull:false
        },
        banner:{
            type:Sequelize.STRING,
            allowNull:false
        },
        interstitial:{
            type:Sequelize.STRING,
            allowNull:false
        },
        nativeAdvanced:{
            type:Sequelize.STRING,
            allowNull:false
        },
        rewarded:{
            type:Sequelize.STRING,
            allowNull:false
        },
        isAndroid:{
            type:Sequelize.BOOLEAN,
            defaultValue:true
        },
        status:{
            type:Sequelize.BOOLEAN,
            defaultValue:false
        }
       },{
        timestamps: true
       });
    return googleAds;
}









