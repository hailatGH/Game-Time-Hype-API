const db = require("../../models");
const bcrypt = require("bcrypt");
const otp = require("otp-generator");
const JWT = require("jsonwebtoken");
const mail = require("./mail");
const fs = require("fs");
const validate = require("../../validation");
const { Op } = require("sequelize");
const removeFile = require("./removeFile");
db.sports.hasMany(db.users, { foreignKey: "sportId" });
db.users.belongsTo(db.sports, { foreignKey: "sportId" });

db.users.hasMany(db.refers, { foreignKey: "userId" });
db.refers.belongsTo(db.users);
db.refers.belongsTo(db.users, {
  foreignKey: "referedUser",
  as: "referenceUser",
});
db.users.hasMany(db.userPermissions);
db.userPermissions.belongsTo(db.users);

async function jsonWebToken(req, res, data, hasLogin = false) {
  childpassword = data.childpassword ? data.childpassword : ""
  
  if (
    req.body.signupvia == 1 &&
    bcrypt.compareSync(req.body.password, data.password) &&
    hasLogin
  ) {
    console.log("\n\n\n\n if \n\n\n\n");
    let jwt = JWT.sign(
      {
        email: data.email,
        id: data.id,
        uno: data.password.slice(10, 20),
      },
      "secret",
      { expiresIn: "365d", notBefore: 1 }
    );
    let resData = { ...data, token: jwt };
    delete resData.password;
    delete resData.otp;
    delete resData.otpvalid;
    setTimeout(() => {
      res.status(201).send({
        statusCode: 201,
        success: true,
        message: "sessions created successfully",
        data: resData,
      });
    }, 2000);
  } else if (
    req.body.signupvia == 1 &&
    bcrypt.compareSync(req.body.password, childpassword) &&
    hasLogin
  ) {
    console.log("\n\n\n\n else if child \n\n\n\n");
    let jwt = JWT.sign(
      {
        email: data.email,
        id: data.id,
        uno: childpassword.slice(10, 20),
      },
      "secret",
      { expiresIn: "365d", notBefore: 1 }
    );
    let resData = { ...data, token: jwt };

    resData.roleId = 1
    resData.fullname = resData.childfullname
    resData.gender = resData.childgender
    resData.age = resData.childage
    resData.sportId = resData.childsportid
    resData.university = resData.childuniversity
    resData.profileImagePath = resData.childprofileimagePath

    delete resData.childpassword;
    delete resData.password;
    delete resData.otp;
    delete resData.otpvalid;

    setTimeout(() => {
      res.status(201).send({
        statusCode: 201,
        success: true,
        message: "sessions created successfully",
        data: resData,
      });
    }, 2000);
  } else if (req.body.signupvia == 1 && hasLogin) {
    {
      console.log("\n\n\n\n else if 403 \n\n\n\n");
      res.status(403).send({
        statusCode: 403,
        success: true,
        message: "email or password is incorrect ",
        data: null,
      });
    }
  } else {
    console.log("\n\n\n\n else \n\n\n\n");
    let jwt = JWT.sign(
      {
        email: data.email,
        id: data.id,
      },
      "secret",
      { expiresIn: "365d", notBefore: 1 }
    );
    let resData = { ...data, token: jwt };
    delete resData.password;
    delete resData.otp;
    delete resData.otpvalid;
    setTimeout(() => {
      res.status(201).send({
        statusCode: 201,
        success: true,
        message: "sessions created successfully",
        data: resData,
      });
    }, 2000);
  }
}

const getotp = (digit = 4) => {
  return otp.generate(digit, {
    lowerCaseAlphabets: false,
    upperCaseAlphabets: false,
    specialChars: false,
  });
};

const getDate = (minutes = 0) => {
  var todayDateTime = new Date().toLocaleString("en-US", {
    timeZone: "Asia/Kolkata",
  });
  todayDateTime = new Date(todayDateTime);
  todayDateTime.setMinutes(todayDateTime.getMinutes() + minutes);
  return todayDateTime;
};

exports.create = async (req, res) => {
  if (!req.body.email) {
    console.log("\n\n\n\n\nHitted Email\n\n\n\n");
    return res.status(400).send({
      success: false,
      message: "please provide email",
    });
  }
  if (req.body.password === null && req.body.signupvia === "password") {
    console.log("\n\n\n\n\nHitted Password\n\n\n\n");
    return res.status(400).send({
      success: false,
      message: "Please Provide password",
    });
  }
  let user = await db.users.findOne({ where: { email: req.body.email } });
  if (user) {
    console.log("\n\n\n\n\nHitted User\n\n\n\n");
    return res.status(400).send({
      success: false,
      message: "User has already Registered",
    });
  }
  if (!user) {
    if (req.body.password) {
      req.body.password = bcrypt.hashSync(req.body.password, 10);
    } else {
      req.body.password = null;
    }
    if (req.files) {
      req.files.profileImagePath
        ? (req.body.profileImagePath = req.files.profileImagePath[0].filename)
        : (req.body.profileImagePath = null);
    }
    let referralCode = (Math.random() + 1).toString(36).substring(2);
    db.users
      .create({
        ...req.body,
        otp: getotp(),
        otpvalid: getDate(3),
        referralCode: referralCode,
      })
      .then(async (data) => {
        if (
          "referralCode" in req.body &&
          req.body.referralCode &&
          req.body.referenceId
        ) {
          await db.refers.create({
            userId: req.body.referenceId,
            referedUser: data.dataValues.id,
            referralCode: req.body.referralCode,
          });
        }
        if ("fcmToken" in req.body && req.body.fcmToken) {
          await db.fcms.destroy({
            where: {
              fcmToken: req.body.fcmToken,
            },
          });
          await db.fcms.upsert({
            fcmToken: req.body.fcmToken,
            userId: data.dataValues.id,
          });
        }
        jsonWebToken(req, res, data.get());
      })
      .catch((err) => {
        console.log(`\n\n\n\n${err}\n\n\n\n`);
        validate(err, res);
      });
  }
};

exports.getotp = async (req, res) => {
  let roleIdUser;
  await db.users
    .findOne({ where: { email: req.params.email } })
    .then(async (data) => {
      if (!data) {
        res.status(402).send({
          success: false,
          message: "Email has been not registerd",
        });
      } else {
        roleIdUser = data?.dataValues?.roleId;
        let OTP = getotp();
        db.users
          .update(
            { otp: OTP, otpvalid: getDate(3) },
            { where: { email: req.params.email } }
          )
          .then((data) => {
            mail(
              OTP,
              req.params.email,
              "OTP Verification",
              `<html>
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
                                Confirm Your OTP</h1>
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
                              <p style="margin: 0;">Please use the verification code below on the Get-Hype APP.</p>
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
                                          <h1 style=" font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;font-weight:bold;">
                                            ${OTP}</h1>
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
              </html>`
            );
            res.status(201).send({
              success: true,
              data: "OTP has been send to your email",
              roleId: roleIdUser,
            });
          })
          .catch((err) => {
            res.status(400).send({
              success: false,
              data: "an error has been occured during sending otp",
            });
          });
      }
    });
};

exports.verifyOTP = async (req, res) => {
  let email = req.body.email;
  if (email && req.body.otp) {
    db.users
      .findOne({ where: { email: email, otp: req.body.otp } })
      .then((data) => {
        if (!data) {
          res.status(400).send({
            success: false,
            message: "Email or OTP is invalid",
          });
        } else if (Date.now() > data.dataValues.otpvalid) {
          res.status(400).send({
            success: false,
            message: "otp valid time has been exceed",
          });
        } else {
          res.status(200).send({
            success: true,
            message: "otp and email are verified successfully.",
          });
        }
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid email and OTP.",
    });
  }
};

exports.changepassword = async (req, res) => {
  await db.users
    .findOne({ where: { email: req.body.email } })
    .then(async (data) => {
      await db.users
        .update(
          { password: bcrypt.hashSync(req.body.password, 10) },
          { where: { email: req.body.email } }
        )
        .then((data) => {
          res.status(201).send({
            success: true,
            data: "your password has been successfully updated",
          });
        })
        .catch((err) => {
          res.status(400).send({
            success: false,
            data: "pass valid email or password in the body",
          });
        });
    })
    .catch((err) => {
      res.status(400).send({ success: false, data: "email not found in DB" });
    });
};

exports.updateUserProfile = async (req, res) => {
  if ("id" in req.body && req.body.id && req.body.isSubAdmin) {
    let id = req.body.id;
    delete req.body.id;
    if (req.body.password) {
      req.body.password = bcrypt.hashSync(req.body.password, 10);
    }
    db.users
      .update({ ...req.body }, { where: { id: id } })
      .then((data) => {
        if (data) {
          res.status(200).send({
            success: true,
            message: "record has been updated successfully.",
          });
        } else {
          res.status(400).send({
            success: false,
            message: "some error occured while fetching record",
          });
        }
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "provide valid id in the body.",
        });
      });
  } else if ("id" in req.body && req.body.id) {
    await db.users
      .update(
        { status: parseInt(req.body.status) },
        { where: { id: req.body.id } }
      )
      .then((data) => {
        res.status(201).send({
          success: true,
          data: "your profile status been successfully updated",
        });
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          data: "please provide valid id and status value.",
        });
      });
  } else {
    if (Object.keys(req.files).length) {
      let userData = await db.users.findOne({
        where: { id: req.token.id },
      });
      if (req.files.profileImagePath) {
        req.body.profileImagePath = req.files.profileImagePath[0].filename;
        removeFile(userData.dataValues.profileImagePath);
      }
    }
    await db.users
      .update({ ...req.body }, { where: { id: req.token.id } })
      .then((data) => {
        res.status(201).send({
          success: true,
          message: "your profile has been successfully updated",
        });
      })
      .catch((err) => {
        res
          .status(400)
          .send({ success: false, message: "pass valid fields in the body" });
      });
  }
};

exports.addChild = async (req, res) => {
  if (Object.keys(req.files).length) {
    let userData = await db.users.findOne({
      where: { id: req.token.id },
    });
    if (req.files.childprofileImagePath) {
      req.body.childprofileImagePath = req.files.childprofileImagePath[0].filename;
      removeFile(userData.dataValues.childprofileImagePath);
    }
  }
  req.body.childpassword = bcrypt.hashSync(req.body.childpassword, 10);
  await db.users
    .update({ ...req.body }, { where: { id: req.token.id } })
    .then((data) => {
      res.status(201).send({
        success: true,
        message: "your child has been successfully added",
      });
    })
    .catch((err) => {
      res
        .status(400)
        .send({ success: false, message: "pass valid fields in the body" });
    });
};

exports.findAll = async (req, res) => {
  let { page, limit, roleId, name } = req.query;
  let where = {};
  name ? (where.fullname = { [Op.iLike]: `%${name.toLowerCase()}%` }) : "";
  roleId ? (where.roleId = parseInt(roleId)) : (where.roleId = ["1", "2", "3"]);
  const { count, rows } = await db.users.findAndCountAll({
    include: [
      {
        model: db.sports,
        attributes: ["name"],
      },
      {
        model: db.userPermissions,
      },
    ],
    where: where,
    attributes: { exclude: ["password", "otp", "otpvalid"] },
    limit: limit,
    offset: page * limit,
  });
  res.status(200).send({
    success: true,
    message: "Record has been fetched successfully.",
    count,
    data: rows,
  });
};

exports.findById = async (req, res) => {
  db.sports.hasMany(db.users, { foreignKey: "sportId" });
  db.users.belongsTo(db.sports, { foreignKey: "sportId" });
  await db.users
    .findOne({
      where: { id: req.params.id, roleId: { [Op.notIn]: [4, 5] } },
      include: [
        {
          model: db.sports,
          attributes: ["name"],
        },
      ],
    })
    .then(async (data) => {
      if (data) {
        let temp = data.get();
        delete temp.otp;
        delete temp.otpvalid;
        delete temp.password;
        temp.sportname = temp?.sport?.name;
        delete temp.sport;
        let hasfollowCheck = await db.community.findOne({
          where: { userId: req.token.id },
        });
        let hasBlock = await db.blocklist.findOne({
          where: { userId: req.token.id, blockedUserId: req.params.id },
        });
        if (hasBlock) {
          temp.hasBlock = true;
        } else {
          temp.hasBlock = false;
        }
        hasfollowCheck
          ? hasfollowCheck?.dataValues?.friendId[req.params.id]
            ? (temp.hasfollow = true)
            : (temp.hasfollow = false)
          : "";
        res.status(200).send({
          message: "Get user by id successfull",
          data: temp,
        });
      } else {
        res.status(400).send({
          message: "Record not found in DB",
        });
      }
    })
    .catch((err) => {
      res.status(400).send({
        message: "Please pass valid id in the param",
      });
    });
};

exports.checkUserName = (req, res) => {
  if (req.body.userName) {
    db.users
      .findOne({ where: { username: req.body.userName } })
      .then(existingUser => {
        if (existingUser) {
          res.status(409).send({
            success: false,
            message: "Username already exists. Please choose a different one."
          });
        } else {
          res.status(200).send({
            success: true,
            message: "Username is available."
          });
        }
      })
      .catch(error => {
        console.error(error);
        res.status(500).send({
          success: false,
          message: "Internal server error."
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "Please provide username",
    });
  }
}

exports.findByName = (req, res) => {
  if (req.body.userName && req.body.findPlayer) {
    // console.log(`\n\n\n\n${req.token.id}\n\n\n\n`);
    db.users
      .findAll({
        // include: [
        //   {
        //     required: false,
        //     model: db.blocklist,
        //     where: { blockedUserId: req.token.id },
        //   },
        // ],
        where: {
          // "$blocklists.blockedUserId$": null,
          fullname: { [Op.iLike]: `%${req.body.userName.toLowerCase()}%` },
          roleId: 1,
        },
        attributes: {
          exclude: ["password", "otp", "otpvalid", "createdAt", "updatedAt"],
        },
      })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "Record has been fetched successfully.",
          data,
        });
      });
  } else if (req.body.userName) {
    if (req.body.id) {
      db.users
        .findAll({
          // include: [
          //   {
          //     required: false,
          //     model: db.blocklist,
          //     where: { blockedUserId: req.token.id },
          //   },
          // ],
          where: {
            // "$blocklists.blockedUserId$": null,
            fullname: { [Op.iLike]: `%${req.body.userName.toLowerCase()}%` },
            roleId: { [Op.notIn]: [4, 5] },
          },
          attributes: ["id", "profileImagePath", "fullname", "university"],
        })
        .then(async (data) => {
          for (i = 0; i < data.length; i++) {
            let hasfollowCheck = await db.community.findOne({
              where: { userId: req.body.id },
            });
            hasfollowCheck
              ? hasfollowCheck.dataValues.friendId[data[i].id]
                ? (data[i].dataValues.hasfollow = true)
                : (data[i].dataValues.hasfollow = false)
              : "";
          }
          res.status(200).send({
            success: true,
            message: "Record has been fetched successfully.",
            data,
          });
        });
    } else {
      return res.status(400).send({
        success: false,
        message: "Please pass valid ID in body",
      });
    }
  } else {
    res.status(400).send({
      success: false,
      message: "Please provide username",
    });
  }
};

exports.findByUserName = (req, res) => {
  if (req.body.userName && req.body.findPlayer) {
    db.users
      .findAll({
        where: {
          fullname: { [Op.iLike]: `%${req.body.userName.toLowerCase()}%` },
          roleId: 1,
        },
        attributes: {
          exclude: ["password", "otp", "otpvalid", "createdAt", "updatedAt"],
        },
      })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "Record has been fetchd successfully.",
          data,
        });
      });
  } else if (req.body.userName) {
    if (req.body.id) {
      db.users
        .findAll({
          where: {
            fullname: { [Op.iLike]: `%${req.body.userName.toLowerCase()}%` },
            roleId: { [Op.notIn]: [4, 5] },
          },
          attributes: ["id", "profileImagePath", "fullname", "university"],
        })
        .then(async (data) => {
          for (i = 0; i < data.length; i++) {
            let hasfollowCheck = await db.community.findOne({
              where: { userId: req.body.id },
            });
            hasfollowCheck
              ? hasfollowCheck.dataValues.friendId[data[i].id]
                ? (data[i].dataValues.hasfollow = true)
                : (data[i].dataValues.hasfollow = false)
              : "";
          }
          res.status(200).send({
            success: true,
            message: "Record has been fetched successfully.",
            data,
          });
        });
    } else {
      return res.status(400).send({
        success: false,
        message: "Please pass valid ID in body",
      });
    }
  } else {
    res.status(400).send({
      success: false,
      message: "Please provide username",
    });
  }
};

exports.login = async (req, res) => {
  !req.body.email
  ? res.status(400).send({ success: false, message: "pass valid email" })
  : "";
  req.body.signupvia = parseInt(req.body.signupvia);
  var signupMethod;
  let user = await db.users.findOne({ where: { email: req.body.email } });
  if (!user) {
    res.status(400).send({
      success: false,
      message: "Please Register first",
    });
  } else if (req.body.signupvia === 1) {
    signupMethod = user.dataValues.signupvia;
    if (user.dataValues.password) {
      signupMethod = user.dataValues.signupvia;
      const result = await bcrypt.compare(req.body.password, user.dataValues.password);
      let childPasswordResult = false
      if (user.dataValues.childpassword) {
        childPasswordResult = await bcrypt.compare(req.body.password, user.dataValues.childpassword);
      }
      if (result) {
        let temp = user.get();
        delete temp.otp;
        delete temp.otpvalid;
        if ("fcmToken" in req.body && req.body.fcmToken) {
          await db.fcms.destroy({
            where: {
              fcmToken: req.body.fcmToken,
            },
          });
          await db.fcms.upsert({
            fcmToken: req.body.fcmToken,
            userId: user.dataValues.id,
          });
        }
        jsonWebToken(req, res, user.get(), (hasLogin = true));
      } else if(childPasswordResult) {
        let temp = user.get();
        delete temp.otp;
        delete temp.otpvalid;
        if ("fcmToken" in req.body && req.body.fcmToken) {
          await db.fcms.destroy({
            where: {
              fcmToken: req.body.fcmToken,
            },
          });
          await db.fcms.upsert({
            fcmToken: req.body.fcmToken,
            userId: user.dataValues.id,
          });
        }
        jsonWebToken(req, res, user.get(), (hasLogin = true));
      } else {
        return res.status(400).send({
          success: false,
          message: "Please provide valid password",
        });
      }
    } else {
      return res.status(400).send({
        success: false,
        message: "you have registered with Apple or Google",
      });
    }
  } else if (req.body.signupvia === 2 || req.body.signupvia === 3) {
    signupMethod = user.dataValues.signupvia;
    await db.users
      .findOne({
        where: {
          email: req.body.email,
          signupvia: parseInt(req.body.signupvia),
        },
      })
      .then(async (data) => {
        if (data) {
          let temp = data.get();
          delete temp.otp;
          delete temp.otpvalid;
          if ("fcmToken" in req.body && req.body.fcmToken) {
            await db.fcms.destroy({
              where: {
                fcmToken: req.body.fcmToken,
              },
            });
            await db.fcms.upsert({
              fcmToken: req.body.fcmToken,
              userId: user.dataValues.id,
            });
          }
          jsonWebToken(req, res, data.get());
        } else {
          res.status(400).send({
            success: false,
            message: `You have Already Login`,
            signupMethod: signupMethod,
          });
        }
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "some error occured while fetching record",
        });
      });
  }
};

exports.logout = async (req, res) => {
  if (
    "userId" in req.body &&
    "fcmToken" in req.body &&
    req.body.fcmToken &&
    req.body.userId
  ) {
    db.fcms
      .destroy({
        where: { fcmToken: req.body.fcmToken, userId: req.body.userId },
      })
      .then((data) => {
        res.status(200).send({
          success: true,
          message: "user logout successfully.",
        });
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "No record found linked with userId and fcmToken",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "provide valid fcmToken and userId in the body.",
    });
  }
};

exports.delete = async (req, res) => {
  if (req.params.id) {
    let id = req.params.id;
    db.users
      .findOne({ where: { id: id } })
      .then(async (data) => {
        if (data) {
          if (req.query?.deletedByAdmin) {
            await db.blacklistedUser.upsert({ email: data.dataValues.email });
          }
          let userRole = await db.users.findOne({
            where: { id: req.token.id },
          });
          if (
            data.dataValues.id === req.token.id ||
            userRole.dataValues.roleId === 4 ||
            userRole.dataValues.roleId == 5
          ) {
            let groupProfilePictures = await db.groups.findAll({
              where: { creatorId: data.dataValues.id },
              attributes: ["profileImage"],
            });
            groupProfilePictures?.map((x) => {
              removeFile(x.dataValues.profileImage);
            });
            let matchVideos = await db.matchVideo.findAll({
              where: { creatorId: data.dataValues.id },
              attributes: ["videoId", "thumbnailId"],
            });
            matchVideos?.map((x) => {
              removeFile(x.dataValues.videoId);
              removeFile(x.dataValues.thumbnailId);
            });
            let photos = await db.photoalbums.findAll({
              where: { userId: data.dataValues.id },
              attributes: ["items"],
            });
            photos?.map((x) => {
              let photoData = Object.keys(x.dataValues.items);
              photoData?.map((y) => {
                removeFile(y);
              });
            });
            const bucket = req.firebase.storage().bucket();
            await bucket
              .deleteFiles({
                prefix: `Files/${data.dataValues.id}`,
              })
              .then(async (data) => {
                await db.songs.destroy({
                  where: { userId: id },
                });
                await db.playlists.destroy({ where: { userId: id } });
              });
            await db.photoalbums.destroy({
              where: { userId: data.dataValues.id },
            });
            let challenges = await db.challenges.findAll({
              where: { userId: data.dataValues.id },
            });
            challenges.map((x) => {
              if (x.dataValues.challengeId) {
                db.sequelize.query(
                  `update challenges SET "acceptedCounter"="acceptedCounter"-1 where "id"='${x.dataValues.challengeId}' and "acceptedCounter">0`,
                  { QueryTypes: "UPDATE" }
                );
                removeFile(x.dataValues.thumbnailId);
                removeFile(x.dataValues.videoId);
              } else {
                removeFile(x.dataValues.thumbnailId);
                removeFile(x.dataValues.videoId);
                db.challenges
                  .findAll({
                    where: { challengeId: x.dataValues.id },
                    attributes: ["videoId", "thumbnailId"],
                  })
                  .then(async (data) => {
                    data.map((y) => {
                      removeFile(y.dataValues.videoId);
                      removeFile(y.dataValues.thumbnailId);
                    });
                  });
              }
            });
            await db.challenges.destroy({
              where: { userId: data.dataValues.id },
            });
            removeFile(data.dataValues.profileImagePath);
            await db.users
              .destroy({ where: { id: data.dataValues.id } })
              .then((data) => {
                res.status(200).send({
                  success: true,
                  message: "User has been deleted successfully",
                });
              })
              .catch((err) => {
                console.log(err);
                res.status(400).send({
                  success: false,
                  message: "some error has been occured while deleting user",
                });
              });
          } else {
            res.status(400).send({
              success: true,
              send: "You are not Authorized to delete this user",
            });
          }
        } else {
          res.status(400).send({
            success: false,
            message: "User doesn't found in the DB.",
          });
        }
      })
      .catch((err) => {
        console.log(err);
        res.status(400).send({
          success: false,
          message: "User doesn't found in the DB.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "Please pass id in the params.",
    });
  }
};

exports.referFind = async (req, res) => {
  db.users
    .findOne({
      where: { referralCode: req.body.referralCode },
      attributes: ["id"],
    })
    .then((data) => {
      res.status(200).send({
        success: data ? true : false,
        message: data
          ? "Records has been successfully fetched."
          : "Records not fetched.",
        data,
      });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error occured while fetching referralCode.",
      });
    });
};

exports.verifyEmail = async (req, res) => {
  let email = req.body.email;
  if (email) {
    db.users
      .findOne({
        where: { email: email },
      })
      .then(async (data) => {
        let blacklisted = await db.blacklistedUser.findOne({
          where: { email: email },
        });
        if (!data) {
          res.status(200).send({
            success: false,
            message: "No Record found",
            blacklisted: blacklisted ? true : false,
          });
        } else {
          res.status(200).send({
            success: true,
            message: "Record has been found in DB.",
            roleId: data?.dataValues?.roleId,
            blacklisted: blacklisted ? true : false,
          });
        }
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please pass email in the body.",
    });
  }
};

exports.getAllRefer = (req, res) => {
  let { page, limit } = req.query;
  db.refers
    .findAll({
      include: [
        {
          model: db.users,
          attributes: [
            "id",
            "fullname",
            "profileImagePath",
            "gender",
            "sportId",
            "age",
            "status",
          ],
        },
        {
          model: db.users,
          as: "referenceUser",
          attributes: ["id", "fullname"],
        },
      ],
      limit: limit,
      offset: page * limit,
      order: [["createdAt", "DESC"]],
    })
    .then(async (data) => {
      if (data) {
        let count = await db.sequelize.query(
          `select count(*)as count from "refers"`,
          { QueryTypes: "SELECT" }
        );
        count = parseInt(count[0][0].count);
        res.status(200).send({
          success: true,
          message: "Records has been fetched successfully.",
          count,
          data,
        });
      } else
        res.status(400).send({
          success: false,
          message: "some error occured while fetching records",
        });
    })
    .catch((err) => {
      res.status(400).send({
        success: false,
        message: "some error has been occured while fetching records",
      });
    });
};

exports.deleteRefer = (req, res) => {
  if (req.params.id) {
    db.refers
      .destroy({ where: { id: req.params.id } })
      .then((data) => {
        if (data) {
          res.status(200).send({
            success: true,
            message: "Record has been deleted successfully.",
          });
        } else {
          res.status(400).send({
            success: false,
            message: "some error occured while deleting record.",
          });
        }
      })
      .catch((err) => {
        res.status(400).send({
          success: false,
          message: "please pass valid id in the params.",
        });
      });
  } else {
    res.status(400).send({
      success: false,
      message: "please pass valid id in params.",
    });
  }
};

exports.signupOTP = (req, res) => {
  if (req.body.email) {
    let OTP = getotp();
    try {
      mail(
        OTP,
        req.body.email,
        "OTP Verification",
        `<html>
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
                          Confirm Your OTP</h1>
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
                        <p style="margin: 0;">Please use the verification code below on the Get-Hype APP.</p>
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
                                    <h1 style=" font-family: 'Source Sans Pro', Helvetica, Arial, sans-serif;font-weight:bold;">
                                      ${OTP}</h1>
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
        </html>`
      );
      res.status(200).send({
        success: true,
        message: "otp has been successfully sended.",
        otp: OTP,
      });
    } catch (error) {
      res.status(400).send({
        success: false,
        message: "some error has been occured.",
      });
    }
  } else {
    res.status(400).send({
      success: false,
      message: "please provide valid email.",
    });
  }
};

exports.deleteSubAdmin = (req, res) => {
  let id = req.params.id;
  if (id) {
    db.users.findOne({ where: { id: id } }).then(async (data) => {
      if (data) {
        if (data.dataValues.roleId == 5) {
          removeFile(data.dataValues.profileImagePath);
          await db.audioTracks.update(
            { userId: null },
            { where: { userId: data.dataValues.id } }
          );
          await db.playlists.update(
            { userId: null },
            { where: { userId: data.dataValues.id } }
          );
          await db.motivationalClips.update(
            { userId: null },
            { where: { userId: data.dataValues.id } }
          );
          await db.games.update(
            { userId: null },
            { where: { userId: data.dataValues.id } }
          );
          await db.users
            .destroy({ where: { id: data.dataValues.id } })
            .then((data) => {
              if (data) {
                res.status(200).send({
                  success: true,
                  message: "Record has been deleted successfully.",
                });
              }
            })
            .catch((err) => {
              res.status(400).send({
                success: false,
                message: "Some error has been occured while deleting data. ",
              });
            });
        } else {
          res.status(400).send({
            success: false,
            message: "You are not authorized to delete this User",
          });
        }
      }
    });
  }
};