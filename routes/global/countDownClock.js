module.exports = (app) =>{
    var router = require("express").Router();
    const countDownClock = require("../../controllers/global/countDownClock.js");
    const verify = require("../verifyToken");

    router.post("/",verify,countDownClock.insertData)
    router.get("/",verify,countDownClock.getAll);
    router.put("/",verify,countDownClock.update);
    router.delete("/",verify,countDownClock.delete);

    app.use("/api/countDownClock",router)
}