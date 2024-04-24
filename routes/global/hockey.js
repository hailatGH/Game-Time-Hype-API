module.exports = (app) =>{
    var router = require("express").Router();
    const hockey = require("../../controllers/global/hockey.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,hockey.getData)
    router.post("/",verify,hockey.insertData)
    router.get("/",verify,hockey.getAllUserdata)
    router.get("/admin",verify,hockey.getAllUserdataAdmin)
    app.use("/api/hockey",router)
}