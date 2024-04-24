module.exports = (app) =>{
    var router = require("express").Router();
    const androidToken = require("../../controllers/global/androidToken.js");
    const verify = require("../verifyToken");

router.post("/",verify,androidToken.sendToken)

app.use("/api/android",router)
}