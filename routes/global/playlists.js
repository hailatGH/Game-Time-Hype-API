module.exports = (app) =>{
    var router = require("express").Router();
    const playlists = require("../../controllers/global/playlists.js");
    const verify = require("../verifyToken");


    router.post("/",verify,playlists.create)
    router.get("/",verify,playlists.getAll)
    router.delete("/",verify,playlists.delete)

    app.use("/api/playlist",router)
}