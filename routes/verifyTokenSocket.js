const db = require("../models");
const JWT = require("jsonwebtoken");
const bcrypt = require("bcrypt");
async function verifyToken(socket,next) {
    
    let token = socket.handshake.headers.authorization;
        if(token) {
            JWT.verify(token,'secret',async function(err,tokendata) {
                if(tokendata) {
                    db.users.findOne({where:{id:tokendata.id}}).then(user => {
                        if(user)
                            if(user && user.dataValues.provider == "password" && tokendata.uno != user.dataValues.password.slice(10, 20)) {
                                return next({message:'token expire please login again'}); 
                            } else {
                                socket.id = user.dataValues.id
                                socket.token = tokendata;
                                socket.username = user.dataValues.fullname
                                socket.uid = user.dataValues.id;
                                next();  
                            }
                        else
                            return next({message:'token expire please login again'});
                    }).catch(err => {})
                    if (err) {
                        return next({message:'token expire please login again'});
                    }
                } else return next({message:'token not match'});
            })
        }
        else {
           return next({message:'please pass token on header'});
        }
    
}

module.exports = verifyToken;