module.exports = (app) =>{
    var router = require("express").Router();
    const challenges = require("../../controllers/global/challenges.js");
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

    router.post("/",upload.single('videoId'),verify,challenges.create)
    router.get("/",verify,challenges.getAll)
    router.get("/myChallenge/page/:page",verify,challenges.myChallenge)
    router.get("/acceptedChallenge/page/:page",verify,challenges.acceptedChallenge)
    router.post("/like",verify,challenges.like)
    router.post("/unlike",verify,challenges.removeLike)
    router.put("/",verify,challenges.update)
    router.delete("/",verify,challenges.deleteChallenge)

    app.use("/api/challenges",router)
}