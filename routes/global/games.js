module.exports = (app) =>{
    var router = require("express").Router();
    const games = require("../../controllers/global/games.js");
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

    router.post("/",upload.single('thumbnail'),verify,games.create)
    router.delete("/:id",verify,games.delete)
    router.get("/admin",verify,games.getAllAdmin)
    router.get("/:id/page/:page",verify,games.getAll)

    app.use("/api/games",router)
}