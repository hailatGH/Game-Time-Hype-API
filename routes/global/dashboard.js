module.exports = (app) =>{
    var router = require("express").Router();
    const dashboard = require("../../controllers/global/dashboard.js");
    const verify = require("../verifyToken");

    router.get("/",verify,dashboard.getData)
    
    app.use("/api/dashboard",router)
}