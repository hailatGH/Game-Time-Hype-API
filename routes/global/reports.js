module.exports = (app) =>{
    var router = require("express").Router();
    const reports = require("../../controllers/global/reports.js");
    const verify = require("../verifyToken");

    router.post("/",verify,reports.createReport)
    router.get("/",verify,reports.getAll)
    router.get("/:id",verify,reports.getById)

    app.use("/api/reports",router)
}