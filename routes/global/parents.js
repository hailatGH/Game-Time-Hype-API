module.exports = (app) =>{
    var router = require("express").Router();
    const parents = require("../../controllers/global/parents.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,parents.getData)
    router.post("/",verify,parents.insertData)
    router.post("/invite",verify,parents.inviteChild)
    router.get("/",verify,parents.getChild)

    app.use("/api/parents",router)
}