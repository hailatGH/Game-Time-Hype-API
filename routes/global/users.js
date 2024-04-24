module.exports = (app) =>{
    var router = require("express").Router();
    const users = require("../../controllers/global/users");
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

    router.post("/",upload.fields([{name:'profileImagePath',maxCount:1}]),users.create)
    router.post("/getotp/:email",users.getotp)
    router.post("/verifyotp",users.verifyOTP)
    router.post("/change/password",users.changepassword)
    router.put("/",verify,upload.fields([{name:'profileImagePath',maxCount:1}]),users.updateUserProfile)
    router.put("/addchild",verify,upload.fields([{name:'childprofileImagePath',maxCount:1}]),users.addChild)
    router.get("/",verify,users.findAll)
    router.get("/getById/:id",verify,users.findById)
    router.get("/getAllRefer",verify,users.getAllRefer)
    router.delete("/refer/:id",verify,users.deleteRefer)

    router.post("/checkUserName",verify,users.checkUserName)

    // router.post("/getByName",verify,users.findByName)
    router.post("/getByName",users.findByName)
    router.post("/findByUserName",users.findByUserName)
    router.post("/login",users.login)
    router.post("/logout",users.logout)
    router.delete("/delete/:id",verify,users.delete)
    router.post("/referFind",users.referFind)
    router.post("/verifyEmail",users.verifyEmail)
    router.post("/signupOTP",users.signupOTP)
    router.delete("/:id",users.deleteSubAdmin)
    app.use("/api/users",router)
}
