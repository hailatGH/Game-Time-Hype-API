module.exports = (app) =>{
    var router = require("express").Router();
    const categories = require("../../controllers/global/categories.js");
    const verify = require("../verifyToken");

    router.get("/getAll/:id",verify,categories.getAll);
    router.post("/",verify,categories.create);

    app.use("/api/categories",router)
}