const { Op, where } = require("sequelize");
const db = require("../../models");
const validate = require("../../validation");
const mail = require("./mail");

exports.getData = (req,res)=>{
    let sportId = parseInt(req.body.sportId);
    if(req.body.childId && req.body.sportId && req.body.date){
        let sportname;
        if(sportId==1)sportname="soccers"
        else if(sportId==2)sportname="basketballs"
        else if(sportId==3)sportname="baseballs"
        else if(sportId==4)sportname="footballs"
        else if(sportId==5)sportname="volleyballs"
        else if(sportId==6)sportname="golfs"
        else if(sportId==7)sportname="tennis"
        else if(sportId==8)sportname="hockey"
        else if(sportId==9)sportname="lacrosses"
        else{
            return res.status(400).send({
                success:false,
                message:"Please provide valid sportId."
            })
        }
        db[sportname].findAll({where:{userId:req.body.childId,date:new Date(req.body.date)}}).then(data=>{
            res.status(200).send({
                success:true,
                message:"Record has been fetched successfully.",
                data
            })
        }).catch(err=>{
            res.status(400).send({
                success:false,
                message:"please provide valid childId and date."
            })
        })
    }else{
        res.status(400).send({
            success:false,
            message:"Please provide valid childId,sportId and date"
        })
    }
}


exports.inviteChild = async (req, res) => {
    if (req.body.childId && req.body.link) {
        try {
            let parent = await db.users.findOne({where:{id: req.token.id}})
            const childEmails = await Promise.all(req.body.childId.map(async (childId) => {
                const child = await db.users.findOne({ where: { id: childId } });
                return child.email;
            }));
            let oldEmails = await db.childInvitees.findOrCreate({where:{parentId: parent.id}})
            let Obj =  new Object(oldEmails[0].dataValues.emails);
            childEmails.map(x=>{
                Obj[x]="PENDING"
            })
            let link = req.body.link;
            let parentName = parent.fullname
            db.childInvitees.update({emails:Obj},{where:{parentId: parent.id}}).then(data1=>{
                mail(null,childEmails,`Invitation from ${parentName}`,`<!DOCTYPE html>
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
                                ${parentName} invited you to be their child!</h1>
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
                                <p style="margin: 0;">Please click the below button to accept the Parent.</p>
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
                                                Click Here to Accept
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
        message: "Provide valid childId and Link in the body",
        });
    }
};


exports.insertData = (req,res)=>{
    // console.log(`\n\n\n child ${req.body.childId}\n\n\n`);
    // console.log(`\n\n\n parent ${req.body.parentId}\n\n\n`);
    // console.log(`\n\n\n token ${req.token.id}\n\n\n`);

    if(req.body.childId && req.body.parentId){
        if(req.body.childId.length >0){
            req.body.childId.forEach(x=>{
                db.parents.create({
                    parentId:req.body.parentId,
                    childId:x
                }).then(data=>{}).catch(err=>{})
            })
            res.status(200).send({
                success:true,
                message:"Record has been created successfully."
            })
        } else {
        res.status(400).send({
            success:false,
            message:"please provide childId in array with min 1 value." 
        })
    }
    }else{
        res.status(400).send({
            success:false,
            message:"please provide valid childId in the body."
        })
    }
}

// exports.insertData = (req,res)=>{
//     if(req.body.childId){
//         if(req.body.childId.length >0){
//             req.body.childId.forEach(x=>{
//                 db.parents.create({
//                     parentId:req.token.id,
//                     childId:x
//                 }).then(data=>{}).catch(err=>{})
//             })
//             res.status(200).send({
//                 success:true,
//                 message:"Record has been created successfully."
//             })
//         }else{
//         res.status(400).send({
//             success:false,
//             message:"please provide childId in array with min 1 value." 
//         })
//     }
//     }else{
//         res.status(400).send({
//             success:false,
//             message:"please provide valid childId in the body."
//         })
//     }
// }

exports.getChild = (req,res)=>{
    db.users.hasMany(db.parents,{foreignKey:'childId'});
    db.parents.belongsTo(db.users,{foreignKey:"childId"});
    db.parents.findAll(
        {
            where:{parentId:req.token.id},
            include: [
                {
                  model: db.users,
                  attributes:['id','fullname','sportId'],
                  include:[
                    {
                        model:db.sports,
                        attributes:['id','name']
                    }
                  ]
                },
              ],
              attributes:['id']
    }).then(data=> {
        res.status(200).send({
            success:true,
            data
        })
    }).catch(err => {
    })
}