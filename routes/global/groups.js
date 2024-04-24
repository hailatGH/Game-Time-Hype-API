module.exports = (app,socket) =>{
    var router = require("express").Router();
    const groups = require("../../controllers/global/groups.js");
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

    router.get ("/:id",verify,groups.getData)
    router.post("/addUser",verify,groups.addUser);
    router.delete("/",verify,groups.deleteUser);
    router.put("/",upload.single('groupProfile'),verify,groups.update)
    router.post("/",upload.single('groupProfile'),verify,groups.insertData)
    router.get("/",verify,groups.getCoachGroup)

    app.use("/api/groups",router)
}