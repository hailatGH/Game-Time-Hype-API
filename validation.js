module.exports = (err, res) => {
  console.log("\n\n\n\n New Hit inside Validate \n\n\n\n");
  var messages = {};
  if (Array.isArray(err))
    err.errors.forEach((error) => {
      switch (error.validatorKey) {
        case "not_unique":
          res.status(409).send({
            statusCode: 409,
            success: false,
            field: error.path,

            message: `${error.path} already exists`,
          });
          break;
        case "null":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} not null`,
          });
          break;
        case "is_null":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} can't be null`,
          });
          break;
        case "len":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} length must be between ${error.validatorArgs[0]} and ${error.validatorArgs[1]} charcter`,
          });
          break;
        case "min":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} length must be ${error.validatorArgs[0]} charcter`,
          });
          break;
        case "max":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} length must be ${error.validatorArgs[0]} charcter`,
          });
          break;
        case "isInt":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} must be integer`,
          });
          break;
        case "notEmpty":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} not empty`,
          });
          break;
        case "isEmail":
          res.status(400).send({
            field: error.path,
            success: false,
            message: `${error.path} not valid`,
          });
          break;
        default:
          res.status(500).send({
            success: false,
            message: "An unexpected error occurred",
          });
          break;
      }
    });
  else {
    res.status(400).send({
      field: err,
      success: false,
      message: err,
    });
  }
  return messages;
};
