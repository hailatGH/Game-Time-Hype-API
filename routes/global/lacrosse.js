module.exports = (app) =>{
    var router = require("express").Router();
    const lacrosse = require("../../controllers/global/lacrosse.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,lacrosse.getData)
    router.post("/",verify,lacrosse.insertData)
    router.get("/",verify,lacrosse.getAllUserdata)
    router.get("/admin",lacrosse.getAllUserdataAdmin)
    app.use("/api/lacrosse",router)
}