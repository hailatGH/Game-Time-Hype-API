const db = require("../models");
const JWT = require("jsonwebtoken");
const bcrypt = require("bcrypt");
async function verifyToken(req, res, next) {
  let token = req.headers["authorization"];
  if (token) {
    JWT.verify(token, "secret", async function (err, tokendata) {
      if (tokendata) {
        db.users
          .findOne({ where: { id: tokendata.id } })
          .then((user) => {
            if (user)
              if (
                user &&
                user.dataValues.provider == "password" &&
                tokendata.uno != user.dataValues.password.slice(10, 20)
              ) {
                return res
                  .status(401)
                  .send({ message: "token expire please login again" });
              } else {
                req.token = tokendata;
                req.username = user.dataValues.username;
                next();
              }
            else
              return res
                .status(401)
                .send({ message: "token expire please login again" });
          })
          .catch((err) => {});
        if (err) {
          return res
            .status(401)
            .send({ message: "token expire please login again" });
        }
      } else return res.status(401).send({ message: "token not match" });
    });
  } else if (req.url.includes('/getByName')) {
    next();
  } else {
    res.status(403).send({ message: "please pass token on header" });
  }
}

module.exports = verifyToken;
