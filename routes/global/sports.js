module.exports = (app) =>{
    var router = require("express").Router();
    const sports = require("../../controllers/global/sports.js");

    router.post("/bulkCreate",sports.bulkCreate)
    router.get("/",sports.findAll)

    app.use("/api/sports",router)
}