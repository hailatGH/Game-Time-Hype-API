module.exports = (app) =>{
    var router = require("express").Router();
    const gamePractices = require("../../controllers/global/gamePractices.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,gamePractices.getByDate)
    router.post("/",verify,gamePractices.create)
    router.put("/",verify,gamePractices.update)
    // router.get("/",verify,gamePractices.getChartDetails)
    // router.get("/:id",verify,gamePractices.getChartDetailsById)

    app.use("/api/gamePractices",router)
}