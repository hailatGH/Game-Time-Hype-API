module.exports = (app) =>{
    var router = require("express").Router();
    const shipping = require("../../controllers/global/shippingRate.js");
    const verify = require("../verifyToken");

    router.post("/",verify,shipping.insert)
    router.get("/",verify,shipping.getAll)

    app.use("/api/shipping",router)
}