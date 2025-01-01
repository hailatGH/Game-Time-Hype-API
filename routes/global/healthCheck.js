module.exports = (app) =>{
    var router = require("express").Router();
    router.get("/health", {"message": "OK"})
    app.use("/api/",router)
}