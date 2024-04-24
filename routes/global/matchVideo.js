module.exports = (app) =>{
    var router = require("express").Router();
    const matchVideo = require("../../controllers/global/matchVideo.js");
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

    router.post("/",upload.single('videoId'),verify,matchVideo.insertData)
    router.get("/",verify,matchVideo.getAllData)
    router.post("/getVideo",verify,matchVideo.getAllVideoByDate)
    
    app.use("/api/matchVideo",router)
}