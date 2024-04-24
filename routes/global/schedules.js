module.exports = (app) =>{
    var router = require("express").Router();
    const schedules = require("../../controllers/global/schedules.js");
    const verify = require("../verifyToken");

    router.post("/",verify,schedules.createSchedule)
    router.put("/:id",verify,schedules.updateSchedule)
    router.get("/",verify,schedules.getAll)
    router.get("/:id",verify,schedules.getById)
    router.delete("/:id",verify,schedules.deleteSchedule)

    app.use("/api/schedules",router)
}