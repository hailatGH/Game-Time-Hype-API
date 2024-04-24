const nodemailer = require("nodemailer");

// async..await is not allowed in global scope, must use a wrapper
async function main(otp,email,subject,html) {
  let transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    secure: false, // true for 465, false for other ports
    auth: {
      user: "noreply.gethype@gmail.com", // generated ethereal user
      pass: "foaafkgremonlxre", // generated ethereal password
    },
  });

  let info = await transporter.sendMail({
    from: 'Get-Hype <noreply.gethype@gmail.com>', // sender address
    to: email, // list of receivers
    subject:subject, // Subject line
    text: otp, // plain text body
    html:html, // html body
  });

  console.log("Message sent: %s", info.messageId);
  console.log("Preview URL: %s", nodemailer.getTestMessageUrl(info));
}


module.exports = main;