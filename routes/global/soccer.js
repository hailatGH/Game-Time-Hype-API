module.exports = (app) =>{
    var router = require("express").Router();
    const soccer = require("../../controllers/global/soccer.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,soccer.getData);
    router.post("/",verify,soccer.insertData);
    router.get("/",verify,soccer.getAllUserRank);
    router.get("/admin",verify,soccer.getAllUserRankAdmin);
    app.use("/api/soccer",router)
}