module.exports = (app) =>{
    var router = require("express").Router();
    const volleyballs = require("../../controllers/global/volleyballs.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,volleyballs.getData)
    router.post("/",verify,volleyballs.insertData)
    router.get("/",verify,volleyballs.getAllUserRank);
    router.get("/admin",verify,volleyballs.getAllUserRankAdmin);

    app.use("/api/volleyball",router)
}