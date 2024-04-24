module.exports = (app) =>{
    var router = require("express").Router();
    const golfs = require("../../controllers/global/golfs.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,golfs.getData)
    router.post("/",verify,golfs.insertData)
    router.get("/",verify,golfs.getAllUserRank);
    router.get("/admin",verify,golfs.getAllUserRankAdmin);

    app.use("/api/golf",router)
}