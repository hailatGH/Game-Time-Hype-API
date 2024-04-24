const fs = require("fs");
const path = require("path");
module.exports = (filename) => {
  if (filename) {
    let path = "uploads/" + filename;
    try {
        if (fs.existsSync(path)) {
            fs.unlink(path,(err) => {
                if (err) throw err;
            });
        }
      } catch(err) {
        console.error(err)
      }
  }
};
