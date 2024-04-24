module.exports = (app) =>{
    var router = require("express").Router();
    const preGameGoals = require("../../controllers/global/preGameGoals.js");
    const verify = require("../verifyToken");

    router.get("/",verify,preGameGoals.findAll)
    router.post("/",verify,preGameGoals.create)
    router.get("/getOne",verify,preGameGoals.findOneLatest)
    router.put("/:id",verify,preGameGoals.update)
    router.delete("/:id",verify,preGameGoals.delete)


    app.use("/api/pregamegoals",router)
}