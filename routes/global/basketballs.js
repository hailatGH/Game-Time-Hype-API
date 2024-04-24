module.exports = (app) =>{
    var router = require("express").Router();
    const basketballs = require("../../controllers/global/basketballs.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,basketballs.getData)
    router.post("/",verify,basketballs.insertData)
    router.get("/",verify,basketballs.getAllUserRank);
    router.get("/admin",verify,basketballs.getAllUserRankAdmin);

    app.use("/api/basketball",router)
}