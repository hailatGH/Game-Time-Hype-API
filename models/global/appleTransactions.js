module.exports = (sequelize,Sequelize) => {
    const appleTransactions = sequelize.define("appleTransactions", {
        id:{
            type:Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey:true
        },
        transactionId: {
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        originalTransactionId: {
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        webOrderLineItemId: {
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        bundleId: {
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        productId: {
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        subscriptionGroupIdentifier: {
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        purchaseDate: {
            type:Sequelize.DATE,
            allowNull:true,
            defaultValue:null
        },
        originalPurchaseDate: {
            type:Sequelize.DATE,
            allowNull:true,
            defaultValue:null
        },
        expiresDate: {
            type:Sequelize.DATE,
            allowNull:true,
            defaultValue:null
        },
        quantity: {
            type:Sequelize.SMALLINT,
            allowNull:true,
            defaultValue:0
        },
        type:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        appAccountToken:{
            type:Sequelize.UUID,
            allowNull:true,
            defaultValue:null
        },
        inAppOwnershipType:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        signedDate:{
            type:Sequelize.DATE,
            allowNull:true,
            defaultValue:null
        },
        autoRenewProductId:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        autoRenewStatus:{
            type:Sequelize.SMALLINT,
            allowNull:true,
            defaultValue:0
        },
        recentSubscriptionStartDate:{
            type:Sequelize.DATE,
            allowNull:true,
            defaultValue:null
        },
        notificationType:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        subtype:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        notificationUUID:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        },
        bundleVersion:{
            type:Sequelize.STRING,
            allowNull:true,
            defaultValue:null
        }
    },{
        freezeTableName: true,
        timestamps: true
    });

    return appleTransactions;
}