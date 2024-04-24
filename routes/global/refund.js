module.exports = (app) =>{
    var router = require("express").Router();
    const refund = require("../../controllers/global/refund.js");
    const verify = require("../verifyToken");

    router.post("/",verify,refund.insert)
    router.get("/",verify,refund.getAll)
    router.put("/",verify,refund.update)

    app.use("/api/refund",router)
}