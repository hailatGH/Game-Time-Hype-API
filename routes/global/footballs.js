module.exports = (app) =>{
    var router = require("express").Router();
    const footballs = require("../../controllers/global/footballs.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,footballs.getData)
    router.post("/",verify,footballs.insertData)
    router.get("/",verify,footballs.getAllUserdata)
    router.get("/admin",verify,footballs.getAllUserdataAdmin)

    app.use("/api/football",router)
}