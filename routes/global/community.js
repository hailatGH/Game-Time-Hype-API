module.exports = (app) =>{
    var router = require("express").Router();
    const community = require("../../controllers/global/community.js");
    const verify = require("../verifyToken");

    router.get("/",verify,community.getAll)
    router.post("/getData",verify,community.getData)
    router.post("/",verify,community.insertData)
                    
    app.use("/api/community",router)
}