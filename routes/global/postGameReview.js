module.exports = (app) =>{
    var router = require("express").Router();
    const postGameReview = require("../../controllers/global/postGameReview.js");
    const verify = require("../verifyToken");

    router.post("/getByDate",verify,postGameReview.findByDate)
    router.post("/",verify,postGameReview.create)
    router.get("/getOne",verify,postGameReview.findOneLatest)
    router.put("/:id",verify,postGameReview.update)

    app.use("/api/postGameReview",router)
}