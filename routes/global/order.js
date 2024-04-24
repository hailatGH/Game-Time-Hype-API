module.exports = (app) =>{
    var router = require("express").Router();
    const order = require("../../controllers/global/order.js");
    const verify = require("../verifyToken");

    router.post("/",verify,order.insert)
    router.get("/getAll",verify,order.getAll)
    router.get("/",verify,order.getByToken)
    router.get("/getById/:id",verify,order.getById)

    app.use("/api/order",router)
}