module.exports = (app) =>{
    var router = require("express").Router();
    const emailInvitees = require("../../controllers/global/emailInvitees");
    const verify = require("../verifyToken");
    
    router.post("/",verify,emailInvitees.sendInvite)
    router.post("/check",verify,emailInvitees.checkInvite)
    router.delete("/",verify,emailInvitees.deleteEmail)
    
    app.use("/api/emailInvitees",router)
}