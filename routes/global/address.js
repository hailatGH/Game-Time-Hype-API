module.exports = (app) =>{
    var router = require("express").Router();
    const address = require("../../controllers/global/address.js");
    const verify = require("../verifyToken");

    router.get("/",verify,address.getAll)
    router.delete("/",verify,address.delete)
    router.post("/",verify,address.create)
    router.put("/",verify,address.update)
    
    app.use("/api/address",router)
}