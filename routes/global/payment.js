module.exports = (app) =>{
    var router = require("express").Router();
    const payment = require("../../controllers/global/payment.js");
    const verify = require("../verifyToken");

    router.post("/",verify,payment.insert)
    router.get("/",verify,payment.getAll)

    app.use("/api/payment",router)
}