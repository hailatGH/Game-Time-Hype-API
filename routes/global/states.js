module.exports = (app) =>{
    var router = require("express").Router();
    const states = require("../../controllers/global/states.js");

    router.post("/bulkCreate",states.bulkCreate)
    router.get("/",states.findAll)

    app.use("/api/states",router)
}