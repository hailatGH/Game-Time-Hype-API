module.exports =async (app) => {
  var router = require("express").Router();
  const messages = require("../../controllers/global/readMessages.js");
  const verify = require("../verifyToken");

  // router.get("/",verify,)
  router.post("/page/:page",verify,messages.getAll)
  router.post("/seen",verify,messages.seen)
  router.delete("/:id",verify,messages.delete)

  app.use("/api/messages",router)
};
