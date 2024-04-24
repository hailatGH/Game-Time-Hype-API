module.exports = (app) =>{
    var router = require("express").Router();
    const userPermissions = require("../../controllers/global/userPermissions.js");
    const verify = require("../verifyToken");

    router.post("/",verify,userPermissions.create)
    router.get("/:id",verify,userPermissions.getAll)
    router.put("/",verify,userPermissions.updateData)

    app.use("/api/userPermissions",router)
}