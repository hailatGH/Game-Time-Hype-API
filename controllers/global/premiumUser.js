const { Op, and } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");
const { google } = require('googleapis');
const androidpublisher = google.androidpublisher('v3');
db.premiumUser.belongsTo(db.users)
db.androidToken.belongsTo(db.users)

exports.findOne = async (req, res) => {
    let productId, expiryDate;
    let data = await db.premiumUser.findOne({ where: { userId: req.token.id } })
    let token = await db.androidToken.findOne({ where: { userId: req.token.id }, attributes: ['token', 'packageName'] })
    token
    if (token) {
        const auth = new google.auth.GoogleAuth({
            keyFilename: './pc-api-5134151343804473404-916-033d5db3c844.json',
            scopes: ['https://www.googleapis.com/auth/androidpublisher'],
        });
        const authClient = await auth.getClient();
        google.options({ auth: authClient });
        const resData = await androidpublisher.purchases.subscriptionsv2.get({
            packageName: token.dataValues.packageName,
            token: token.dataValues.token,
        });
        productId = resData?.data?.lineItems[0]?.productId
        expiryDate = resData?.data?.lineItems[0]?.expiryTime
    }
    if (expiryDate || data) {
        if (expiryDate && data) {
            if (new Date(data?.dataValues?.expiryDate) > new Date(expiryDate)) {
                return res.status(200).send({
                    success: true,
                    message: "Record has been fetched successfully.",
                    data
                })
            } else {
                return res.status(200).send({
                    success: true,
                    message: "Record has been fetched successfully.",
                    data: {
                        userId: req.token.id,
                        expiryDate,
                        productId
                    }
                })
            }
        } else if (expiryDate) {
            return res.status(200).send({
                success: true,
                message: "Record has been fetched successfully.",
                data: {
                    userId: req.token.id,
                    expiryDate,
                    productId
                }
            })
        } else if (data) {
            return res.status(200).send({
                success: true,
                message: "Record has been fetched successfully.",
                data
            })
        }
    } else {
        return res.status(200).send({
            success: false,
            message: "No premium found for this user",
            data: null
        })
    }
}

exports.findAll = async (req, res) => {
    try {
        let appleUserData
        let androidToken = await db.androidToken.findAll({
            include: [
                {
                    model: db.users,
                    attributes: ['fullname', 'status', 'profileImagePath']
                }
            ]
        })
        for (let i = 0; i < androidToken.length; i++) {

                const auth = new google.auth.GoogleAuth({
                    keyFilename: './pc-api-5134151343804473404-916-033d5db3c844.json',
                    scopes: ['https://www.googleapis.com/auth/androidpublisher'],
                });
                const authClient = await auth.getClient();
                google.options({ auth: authClient });

                let resData = await androidpublisher.purchases.subscriptionsv2.get({
                    packageName: androidToken[i].dataValues.packageName,
                    token: androidToken[i].dataValues.token,
                }).then(d => {
                    productId = resData?.data?.lineItems[0]?.productId
                    expiryDate = resData?.data?.lineItems[0]?.expiryTime
                    androidToken[i].dataValues.expiryDate = expiryDate
                    androidToken[i].dataValues.productId = productId
                    androidToken[i].dataValues.platform = "Android"
                    console.log(d.data)
                }).catch(e => {
                    androidToken[i].dataValues.expiryDate = ""
                    androidToken[i].dataValues.productId = ""
                    androidToken[i].dataValues.platform = "Android"
                });
                
                // let o = {
                //     headers: {
                //         'x-goog-api-client': 'gdcl/6.0.4 gl-node/18.7.0 auth/8.7.0',
                //         'Accept-Encoding': 'gzip',
                //         'User-Agent': 'google-api-nodejs-client/6.0.4 (gzip)',
                //         Authorization: 'Bearer ya29.c.b0Aaekm1L1wSaH7EVYy1e-RirSVh9n4n8oE3VasOfSKTp9A2R8fFUsm8FfMKfL4nAuXhHtFCBtM4fsL_T9a9R80FRDiyY429qiNTD8l9ULHqZ3lwxtCrhBj-p7_ymfU3apVe4IXHFnf4MicaxhpCAHFxR6mP1GPOnllYAKiRZEhjKAgL0CTrDVnEVg2DPVZe5F7rq39_2YMaphMpntvuG5_jUE6oJGw9u7PhEsv18uiY8kYnOZwaXHjMDjwEnT0_wlzarPb1C_Mlr8a8SCTmWXkdHbm0yCRJTIJFjh8pLRxstsshklyOp4LqK9ysgbx3okhGqZ3uNgofj3L341DknwmUrR9bUkdjMYrowWkyYh3zey0pznQQtJWoQ1eat4jyVkVgop5kgqxuinkfOMQgltkFn6MJ6O8vekUtdbxUx78vIz2X_pdrd5wfMJU8ZichJZf-rUO3eXSe9V1qOBivrghxxsbs0iz_QMgU4yOJVtBlfrU7IsyQQvaYiBZssl4Qkj42-M-x7-v_jO40uf7vgW2tVellrznkkgkBb17aS6x4hV6Oy3bRk2M7yWRcIFxq59W3vpp338U7Z0IiY7o_0leJObjYwxqk7wqvvd3uObfU3wx2IFI89t3M4mjRferfZdJy7_YWd3j8jW_lwdzavS3Yr2Xim0c1BO3iZBrbslgi3BfqJoYORUihlrccB9ZzXYo-vJ8RxyxpfbfYwqROncbpxaXdmrB4YvpugqQiwnRUFjIIS1tlF2a7i2k-IBuZfwwwXrrSjoSkYU4lVxqe5vmwXI_MOjpYrpfRaBYU67xwj_nhVIUof5oQ1Oa1M-y9wtXws30OifgB6hRp4McvR1ZXS1q4ZedhZfSfgq8cSUmfX2hSRcwwBZ0wMl-FR8t9z7dusZX3b47nxyi9fjQQvfeJsq0ZfU11yMpbYX4jgIiigVBSpc1u3QFWgv6vWfr5grn_4VW6rBkJ-yh-6jtlQIcfrba_41Wy87udxgWfijs0q0cB5xmxbyh9I',
                //         Accept: 'application/json'
                //     },
                //     method: "GET"
                // };
                // let resData =
                //     await fetch(`https://androidpublisher.googleapis.com/androidpublisher/v3/applications/${androidToken[i].dataValues.packageName}/purchases/subscriptionsv2/tokens/${androidToken[i].dataValues.token}`, o)
                // const movies = resData;
                // console.log(movies);

               
            
           
        }
        let premiumU = await db.premiumUser.findAll({
            include: [
                {
                    model: db.users,
                    attributes: ['fullname', 'status', 'profileImagePath']
                }
            ]
        })
        data = premiumU?.map(x => {
            x.dataValues.platform = "Apple";
            return x.dataValues
        })
        appleUserData = data
        if (appleUserData && androidToken) {
            let data = new Array(...appleUserData, ...androidToken)
            await res.status(200).send({
                success: true,
                message: "record has been fetched successfully.",
                data
            })
        }

    } catch (e) {
        console.log(e)
    }

}