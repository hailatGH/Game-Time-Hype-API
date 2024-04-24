module.exports = (app) =>{
    var router = require("express").Router();
    const tennis = require("../../controllers/global/tennis.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,tennis.getData)
    router.post("/",verify,tennis.insertData)
    router.get("/",verify,tennis.getAllUserRank);
    router.get("/admin",verify,tennis.getAllUserRankAdmin);

    app.use("/api/tennis",router)
}