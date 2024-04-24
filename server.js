const express = require("express");
const app = express();
const server = require("http").createServer(app);
var useragent = require("express-useragent");
const cors = require("cors");
const fs = require("fs");
const db = require("./models/index.js");
const verifyTokenSocket = require("./routes/verifyTokenSocket");
const messages = require("./controllers/global/messages");
const serviceAccount = require("./get-hype-firebase-adminsdk.json");
const admin = require("firebase-admin");
db.sequelize.sync({ force: false });
var onlineUsers = {};
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(useragent.express());

const defaultApp = admin.initializeApp({
  storageBucket: "gs://get-hype-43efa.appspot.com/",
  credential: admin.credential.cert(serviceAccount),
});

app.get("/api/uploads/:id", (req, res) => {
  let imageName = ["undefined", "null"].includes(req.params.id)
    ? "mainlogo.png"
    : req.params.id;

  res.sendFile(__dirname + "/uploads/" + imageName);
});

const PORT = process.env.PORT || 8000;
app.get("/", (req, res) => {
  res.send("Welcome to Get Hype");
});

app.get("/download", (req, res) => {
  if (req.useragent.isAndroid) {
    res.redirect(
      "https://play.google.com/store/apps/details?id=com.gethypeplayer"
    );
  } else if (
    req.useragent.isiPhone ||
    req.useragent.isiPod ||
    req.useragent.isiPad
  ) {
    res.redirect("https://apps.apple.com/in/app/gameTimeHype");
  } else {
    res.redirect("https://get-hype-app.com/#/");
  }
});

server.listen(PORT, () => {});

app.use((req, res, next) => {
  req.firebase = defaultApp;
  next();
});

const io = require("socket.io")(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});
var myUrlLogger = (upperCase)=>{
  
  if( typeof upperCase !== 'boolean' ){
    upperCase = true;
  }
  
  return (req,res,next) =>{
   
   console.log('Logging:', (upperCase ? req.url.toUpperCase() : req.url.toLowerCase()));
   
   next();
  }
}

// Set the middleware before your routes
app.use(myUrlLogger(false));
const dynamicNsp = io
  .use(function (socket, next) {
    if (
      socket.handshake.headers.authorization &&
      socket.handshake.headers.authorization !== ""
    ) {
      try {
        verifyTokenSocket(socket, next);
      } catch (err) {}
    } else {
      next(new Error("pass valid token"));
    }
  })
  .on("connection", (socket) => {
    for (let [id, socket] of io.of("/").sockets) {
      onlineUsers[socket.uid] = {
        socketId: id,
        username: socket.username,
        id: socket.uid,
      };
    }
    socket.on("disconnect", () => {
      delete onlineUsers[socket.uid];
    });
    socket.on("insertMessage", (arg) => {
      messages.insertData({ socket, arg, onlineUsers, defaultApp });
    });

    socket.on("getMessages", async (arg) => {
      let data = await messages.getData({ socket, onlineUsers });
    });
  });
require("./routes/index.js")(app);
