module.exports = (app) =>{
    var router = require("express").Router();
    const teams = require("../../controllers/global/teams.js");
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

    router.post("/",upload.single('teamProfile'),verify,teams.createTeam)
    router.put("/",upload.single('teamProfile'),verify,teams.updateTeam)
    router.get("/",verify,teams.getAllTeam)
    router.get("/:id",verify,teams.getAllMembers)
    router.get("/getMemebersAcrossTeams/:id",verify,teams.getAllMembersAcrossTeams)
    router.delete("/",verify,teams.deleteTeam)
    router.delete("/member",verify,teams.removeMember)

    app.use("/api/teams",router)
}