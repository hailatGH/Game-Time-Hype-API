module.exports = (app) => {
    var router = require("express").Router();
    const blocklist = require("../../controllers/global/blocklist.js");
    const verify = require("../verifyToken");
    
    router.get("/page/:page",verify,blocklist.findAll);
    router.get("/:id",verify,blocklist.findOne);
    router.post("/",verify,blocklist.create);
    router.post("/all",verify,blocklist.bulkcreate);
    router.put("/:id",verify,blocklist.update);
    router.delete("/:id",verify,blocklist.delete);

    app.use("/api/blocklist",router);
}