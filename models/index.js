const dbConfig = require("../db/config");

const Sequelize = require("sequelize");
const merchandise = require("./global/merchandise");

const sequelize = new Sequelize(dbConfig.DB,dbConfig.USER,dbConfig.PASSWORD, {
    host:dbConfig.HOST,
    dialect:dbConfig.dialect,
    dialectOptions: {
        dateStrings: true,
      //   ssl: {     
      //   require: true,
      //   rejectUnauthorized: false 
      // },
        typeCast: function (field, next) { 
          if (field.type === 'DATETIME') {
            return field.string()
          }
            return next()
          },
      },
      // timezone: '+05:30',
    operatorsAliases:false,
    logging:true
});

const db = {};

db.users = require("./global/users")(sequelize,Sequelize);
db.roles = require("./global/roles")(sequelize,Sequelize);
db.sports = require("./global/sports")(sequelize,Sequelize);
db.pregamegoals = require("./global/preGameGoals")(sequelize,Sequelize);
db.photoalbums = require("./global/photoalbum")(sequelize,Sequelize);
db.gamePractices = require("./global/gamePractices")(sequelize,Sequelize);
db.soccers = require("./global/soccer")(sequelize,Sequelize);
db.motivationalClips = require("./global/motivationalClips")(sequelize,Sequelize);
db.motivationalClipsLikes = require("./global/motivationalClipsLikes")(sequelize,Sequelize);
db.audioTracks = require("./global/audioTracks")(sequelize,Sequelize);
db.basketballs = require("./global/basketball")(sequelize,Sequelize);
db.baseballs = require("./global/baseball")(sequelize,Sequelize)
db.footballs = require("./global/football")(sequelize,Sequelize);
db.volleyballs = require("./global/volleyball")(sequelize,Sequelize);
db.golfs = require("./global/golf")(sequelize,Sequelize);
db.tennis = require("./global/tennis")(sequelize,Sequelize);
db.hockey = require("./global/hockey")(sequelize,Sequelize);
db.lacrosses = require("./global/lacrosse")(sequelize,Sequelize);
db.countDownClock = require("./global/countDownClock")(sequelize,Sequelize);
db.categories = require("./global/categories")(sequelize,Sequelize);
db.merchandise = require("./global/merchandise")(sequelize,Sequelize);
db.carts = require("./global/carts")(sequelize,Sequelize);
db.addresses = require("./global/address")(sequelize,Sequelize);
db.challenges = require("./global/challenges")(sequelize,Sequelize);
db.challengesLikes = require("./global/challengesLikes")(sequelize,Sequelize);
db.refers = require("./global/refers")(sequelize,Sequelize);
db.googleAds = require("./global/googleAds")(sequelize,Sequelize);
db.parents = require("./global/parents")(sequelize,Sequelize);
db.playlists = require("./global/playlists")(sequelize,Sequelize);
db.messages = require("./global/messages")(sequelize,Sequelize);
db.games = require("./global/games")(sequelize,Sequelize);
db.community = require("./global/community")(sequelize,Sequelize);
db.groups = require("./global/group")(sequelize,Sequelize);
db.usergroupdetails = require("./global/userGroupDetails")(sequelize,Sequelize);
db.states = require("./global/state")(sequelize,Sequelize);
db.matchVideo = require("./global/matchVideos")(sequelize,Sequelize);
db.postGameReview = require("./global/postGameReview")(sequelize,Sequelize);
db.getLatestMessages = require("./global/getLatestMessage")(sequelize,Sequelize);
db.modules = require("./global/modules")(sequelize,Sequelize);
db.userPermissions = require("./global/user-permission")(sequelize,Sequelize);
db.payment = require("./global/payment")(sequelize,Sequelize);
db.premiumUser = require("./global/premiumUser")(sequelize,Sequelize);
db.order = require("./global/order")(sequelize,Sequelize);
db.refund = require("./global/refund")(sequelize,Sequelize);
db.shippingRate = require("./global/shippingRate")(sequelize,Sequelize);
db.appleIds = require("./global/appleIds")(sequelize,Sequelize);
db.appleTransactions = require("./global/appleTransactions")(sequelize,Sequelize);
db.fcms = require("./global/fcms")(sequelize,Sequelize);
db.androidToken = require("./global/androidTokens")(sequelize,Sequelize);
db.reports = require("./global/reports")(sequelize,Sequelize);
db.songs = require("./global/songs")(sequelize,Sequelize);
db.teams = require("./global/teams")(sequelize,Sequelize);
db.emailInvitees = require("./global/emailInvitee")(sequelize,Sequelize);
db.childInvitees = require("./global/childInvitee")(sequelize,Sequelize);
db.userTeams = require("./global/userTeams")(sequelize,Sequelize);
db.schedules = require("./global/schedules")(sequelize,Sequelize);
db.blacklistedUser = require("./global/blacklistedUser")(sequelize,Sequelize);
db.blocklist = require("./global/blocklist")(sequelize,Sequelize);

db.users.hasMany(db.pregamegoals)
db.users.hasMany(db.gamePractices)
db.merchandise.belongsTo(db.categories);
db.categories.hasMany(db.merchandise)
db.carts.belongsTo(db.merchandise);
db.merchandise.hasMany(db.carts);
db.users.hasMany(db.blocklist);
db.blocklist.belongsTo(db.users,{foreignKey:'blockedUserId',as:"blockedUser"});
db.challenges.belongsTo(db.users)

db.Sequelize = Sequelize;
db.sequelize = sequelize;

module.exports = db;