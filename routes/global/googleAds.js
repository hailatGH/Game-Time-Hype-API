module.exports = (app) =>{
    var router = require("express").Router();
    const googleAds = require("../../controllers/global/googleAds.js");
    const verify = require("../verifyToken");

    router.get("/",googleAds.getData)
    router.post("/",verify,googleAds.create)

    app.use("/api/googleAds",router)
}