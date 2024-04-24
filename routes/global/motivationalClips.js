module.exports = (app) =>{
    var router = require("express").Router();
    const motivationalClips = require("../../controllers/global/motivationalClips.js");
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

    router.post("/",upload.fields([{name:'videoId',maxCount:1},{name:'thumbnail',maxCount:1}]),verify,motivationalClips.create)
    router.put("/:id",upload.fields([{name:'videoId',maxCount:1},{name:'thumbnail',maxCount:1}]),verify,motivationalClips.update)
    router.get("/",verify,motivationalClips.getAll)
    router.delete("/:id",verify,motivationalClips.delete)
    router.get("/getOne",verify,motivationalClips.findOneLatest)
    router.get("/liked",verify,motivationalClips.getlikedClips)
    router.post("/like",verify,motivationalClips.like)
    router.post("/unlike",verify,motivationalClips.removeLike)

    app.use("/api/motivationalClips",router)
}