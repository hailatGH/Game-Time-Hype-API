module.exports = (app) =>{
    var router = require("express").Router();
    const photoAlbums = require("../../controllers/global/photoAlbums.js");
    const verify = require("../verifyToken");
    const multer  = require('multer');

    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
        cb(null, './uploads')
        },
        filename: function (req, file, cb) {
        let ext = file.originalname.substring(file.originalname.lastIndexOf('.'), file.originalname.length);
        cb(null, Date.now() + '-' + Math.round(Math.random() * 1E9) + ext)
        }
    })

    const upload = multer({storage:storage});

    router.post("/",upload.array('items'),verify,photoAlbums.create)
    router.get("/",verify,photoAlbums.getAll)
    router.delete("/deletePhotos",photoAlbums.deletePhotos)
    router.delete("/deleteAlbum",photoAlbums.deleteAlbum)


    app.use("/api/photoAlbums",router)
}