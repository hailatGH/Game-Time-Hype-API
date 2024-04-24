module.exports = (app) =>{
    var router = require("express").Router();
    const baseballs = require("../../controllers/global/baseballs.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,baseballs.getData)
    router.post("/",verify,baseballs.insertData)
    router.get("/",verify,baseballs.getAllUserRank);
    router.get("/admin",verify,baseballs.getAllUserRankAdmin);

    app.use("/api/baseball",router)
}