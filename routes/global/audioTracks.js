module.exports = (app) =>{
    var router = require("express").Router();
    const audioTracks = require("../../controllers/global/audioTracks.js");
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

    router.post("/",upload.fields([{name:'thumbnail',maxCount:1},{name:'item',maxCount:1}]),verify,audioTracks.create)
    router.post("/getAll/page/:page",verify,audioTracks.getAll)
    router.post("/getByName",verify,audioTracks.getByName)
    router.get("/getAll",verify,audioTracks.getAllAdmin)

    app.use("/api/audioTracks",router)
}