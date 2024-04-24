module.exports = (app) =>{
    var router = require("express").Router();
    const carts = require("../../controllers/global/carts.js");
    const verify = require("../verifyToken");

    router.get("/",verify,carts.getAll)
    router.delete("/",verify,carts.delete)
    router.post("/",verify,carts.create)
    router.put("/",verify,carts.update)
    
    app.use("/api/carts",router)
}