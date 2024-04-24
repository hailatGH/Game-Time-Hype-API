module.exports = (app) => {
    require("../routes/global/users")(app)
    require("../routes/global/pregamegoals")(app)
    require("../routes/global/photoAlbums")(app)
    require("../routes/global/sports")(app)
    require("../routes/global/gamePractices")(app)
    require("../routes/global/soccer")(app)
    require("../routes/global/motivationalClips")(app)
    require("../routes/global/audioTracks")(app)
    require("../routes/global/basketballs")(app)
    require("../routes/global/baseballs")(app)
    require("../routes/global/footballs")(app)
    require("../routes/global/volleyballs")(app)
    require("../routes/global/golfs")(app)
    require("../routes/global/tennis")(app)
    require("../routes/global/hockey")(app)
    require("../routes/global/lacrosse")(app)
    require("../routes/global/countDownClock")(app)
    require("../routes/global/categories")(app)
    require("../routes/global/merchandise")(app)
    require("../routes/global/carts")(app)
    require("../routes/global/roles")(app)
    require("../routes/global/address")(app)
    require("../routes/global/challenges")(app)
    require("../routes/global/googleAds")(app)
    require("../routes/global/parents")(app)
    require("../routes/global/playlists")(app)
    require("../routes/global/games")(app)
    require("../routes/global/community")(app)
    require("../routes/global/groups")(app)
    require("../routes/global/states")(app)
    require("../routes/global/premiumUser")(app)
    require("../routes/global/matchVideo")(app)
    require("../routes/global/postGameReview")(app)
    require("../routes/global/messages")(app)
    require("../routes/global/module")(app)
    require("../routes/global/user-permissions")(app)
    require("../routes/global/payment")(app)
    require("../routes/global/order")(app)
    require("../routes/global/refund")(app)
    require("../routes/global/shippingRate")(app)
    require("../routes/global/appleIds")(app)
    require("../routes/global/androidToken")(app)
    require("../routes/global/dashboard")(app)
    require("../routes/global/reports")(app)
    require("../routes/global/songs")(app)
    require("../routes/global/teams")(app)
    require("../routes/global/emailInvitees")(app)
    require("../routes/global/schedules")(app)
    require("../routes/global/blocklist")(app)
}