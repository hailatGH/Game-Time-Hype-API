module.exports = (app) =>{
    var router = require("express").Router();
    const merchandise = require("../../controllers/global/merchandise.js");
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

    router.get("/",verify,merchandise.getAllAdmin);
    router.get("/getAll/:id/page/:page",verify,merchandise.getAll);
    router.post("/getById",verify,merchandise.getById);
    router.get("/getLatest",verify,merchandise.getLatest);
    router.put("/status",upload.fields([{name:'thumbnail',maxCount:1},{name:'media',maxCount:10}]),verify,merchandise.update);
    router.post("/",verify,upload.fields([{name:'thumbnail',maxCount:1},{name:'media',maxCount:10}]),merchandise.create);
    router.delete("/:id",verify,merchandise.deleteMerchandise)
    
    app.use("/api/merchandise",router)
}