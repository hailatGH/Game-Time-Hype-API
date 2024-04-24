module.exports = (app) =>{
    var router = require("express").Router();
    const appleIds = require("../../controllers/global/appleIds.js");
    const verify = require("../verifyToken");

router.get("/:id",appleIds.getAppleId)
router.post("/",appleIds.sendAppleId),
router.post("/subscription",appleIds.appleNotification)

app.use("/api/apple",router)
}