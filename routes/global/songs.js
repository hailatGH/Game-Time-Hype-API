module.exports = (app) =>{
    var router = require("express").Router();
    const songs = require("../../controllers/global/songs.js");
    const verify = require("../verifyToken");


    router.post("/",verify,songs.create)
    router.get("/",verify,songs.getById)
    router.delete("/",verify,songs.deleteSong)
    
    app.use("/api/songs",router)
}