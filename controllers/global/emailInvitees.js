const db = require("../../models");
const mail = require("./mail");

exports.sendInvite = async (req, res) => {
  if (req.body.teamId && req.body.emails.length) {
    try {
      let oldEmails = await db.emailInvitees.findOrCreate({where:{teamId:req.body.teamId}})
      let Obj =  new Object(oldEmails[0].dataValues.emails);
      req.body.emails.map(x=>{
        Obj[x]="PENDING"
      })
      let teamInstance =  await db.teams.findOne({where:{id:req.body.teamId},attribute:['link', 'name']});
      // let link = await db.teams.findOne({where:{id:req.body.teamId},attribute:['link']})
      link = teamInstance.dataValues.link;
      teamName = teamInstance.dataValues.name;
      db.emailInvitees.update({emails:Obj},{where:{teamId:req.body.teamId}}).then(data1=>{
        mail(null,req.body.emails,`Invitation to join ${teamName}`,`<!DOCTYPE html>
        <html>
        <head>
          <meta charset="utf-8">
          <meta http-equiv="x-ua-compatible" content="ie=edge">
          <title>Email Confirmation</title>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <style type="text/css">
            @media screen {
              @font-face {
                font-family: 'Source Sans Pro';
                font-style: normal;
                font-weight: 400;
                src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format('woff');
              }
        
              @font-face {
                font-family: 'Source Sans Pro';
                font-style: normal;
                font-weight: 700;
                src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format('woff');
              }
            }
        
            body,
            table,
            td,
            a {
              -ms-text-size-adjust: 100%;
              /* 1 */
              -webkit-text-size-adjust: 100%;
              /* 2 */
            }
        
            table,
            td {
              mso-table-rspace: 0pt;
              mso-table-lspace: 0pt;
            }
        
            img {
              -ms-interpolation-mode: bicubic;
            }
        
            a[x-apple-data-detectors] {
              font-family: inherit !important;
              font-size: inherit !important;
              font-weight: inherit !important;
              line-height: inherit !important;
              color: inherit !important;
              text-decoration: none !important;
            }
        
            div[style*="margin: 16px 0;"] {
              margin: 0 !important;
            }
        
            body {
              width: 100% !important;
              height: 100% !important;
              padding: 0 !important;
              margin: 0 !important;
            }
        
            table {
              border-collapse: collapse !important;
            }
        
            a {
              color: #1a82e2;
            }
        
            img {
              height: 100px;
              width: 100px;
            }
        
            .mainStyle {
              padding: 100px;
              background-color: #e9ecef;
            }
        
            .mainHeading {
              margin: 0px;
              font-size: 32px;
              font-weight: 700;
              letter-spacing: -1px;
              line-height: 48px;
            }
        
        
            @media only screen and (max-width: 597px) {
              .mainStyle {
                padding: 20px;
                background-color: #e9ecef;
              }
        
              .mainHeading {
                margin: 0px;
                font-size: 22px;
                font-weight: 700;
                letter-spacing: -1px;
                line-height: 20px;
              }
            }
          </style>
        
        </head>
        
        <body>
          <div class="mainStyle">
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td align="center" bgcolor="#e9ecef">
                  <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                      <td align="center" valign="top" style="padding-bottom:36px;">
                        <a href="https://get-hype-app.com/#" target="_blank" style="display: inline-block;">
                          <img src="https://get-hype-app.com/assets/images/mainlogo.png" alt="Logo" border="0"
                            style="display: block;">
                        </a>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="center" bgcolor="#e9ecef">
                  <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                      <td align="left" bgcolor="#ffffff"
                        style="padding: 36px 24px 0; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; border-top: 3px solid #d4dadf;">
                        <h1 class="mainHeading">
                          Invitation To Join ${teamName} Team</h1>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="center" bgcolor="#e9ecef">
                  <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                      <td align="left" bgcolor="#ffffff"
                        style="padding: 24px; font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px;">
                        <p style="margin: 0;">Please click the below button to join the Team.</p>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" bgcolor="#ffffff">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                          <tr>
                            <td align="center" bgcolor="#ffffff" style="padding: 12px;">
                              <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td align="center" style="border-radius: 6px;">
                                    <!-- <h1 style=" font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;font-weight:bold;">123456</h1> -->
                                    <a href='${link}' style="text-decoration: none;">
                                      <button
                                        style="color: white;background-color: #01B9EB; padding: 15px;border-radius: 5px;border: none;font-weight: 700;cursor:pointer">
                                        Click Here to Join
                                      </button></a>
                                  </td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align="left" bgcolor="#ffffff"
                        style="padding: 24px;font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; border-bottom: 3px solid #d4dadf">
                        <p style="margin: 0;">Cheers,<br> Get-Hype</p>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </div>
        </body>
        </html>`)
        res.status(200).send({
          success:true,
          message:"Email has been sended successfully."
        })
      })
    } catch (error) {
      console.log(error);
    }
  } else {
    res.status(400).send({
      success: false,
      message: "Provide valid teamId,emails in the body",
    });
  }
};

exports.checkInvite = (req, res) => {
    if(req.body.email && req.body.teamId){
       db.emailInvitees.findOne({where:{teamId:req.body.teamId}}).then(data=>{
        if(data){
          if(req.body.email in data.dataValues.emails){
            res.status(200).send({
              success:true,
              message:"User has been invited."
            })
          }else{
            res.status(200).send({
              success:false,
              message:"No invitation found for this user."
            })
          }
        }else{
          res.status(200).send({
            success:false,
            message:"Team doesn't found."
          })
        }
      }).catch(err=>{
        res.status(200).send({
          success:false,
          message:"some error has been occured while checking Invite.",
          data:"provide valid Team Id"
        })
      })
    }else{
      res.status(400).send({
        success:false,
        message:"provide valid email and teamId in the body."
      })
    }
};

exports.deleteEmail = async(req,res) => {
  if(req.body.email && req.body.teamId){
    let oldEmails = await db.emailInvitees.findOne({where:{teamId:req.body.teamId}})
    if(oldEmails){
      let Obj = new Object(oldEmails.dataValues.emails);
      // delete Obj[req.body.email]
      Obj[req.body.email] = "ACCEPTED"
      await db.emailInvitees.update({emails:Obj},{where:{teamId:req.body.teamId}})
      res.status(200).send({
        success:true,
        message:"User has accepted the request"
      })
    }else{
      res.status(400).send({
        success:false,
        message:"No teams found for this Id."
      })
    }
  }else{
    res.status(400).send({
      success:false,
      message:"provide valid email and teamId in the body."
    })
  }
} 