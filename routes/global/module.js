module.exports =async (app) => {
    var router = require("express").Router();
    const module = require("../../controllers/global/module.js");
    const verify = require("../verifyToken");
  
    router.get("/",verify,module.getAll)
    router.get("/:id",verify,module.getById)
    router.post("/",verify,module.insertModule)
    router.put("/",verify,module.update)
    router.delete("/:id",verify,module.delete)
  
    app.use("/api/module",router)
  };
  