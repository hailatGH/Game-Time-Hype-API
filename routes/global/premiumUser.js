module.exports = (app) =>{
    var router = require("express").Router();
    const premiumUser = require("../../controllers/global/premiumUser.js");
    const verify = require("../verifyToken");

    router.get("/",verify,premiumUser.findAll)
    router.get("/findOne",verify,premiumUser.findOne)



    app.use("/api/premiumUser",router)
}