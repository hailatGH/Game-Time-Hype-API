async function sendNotification(firebase,registrationToken,data) {
    const message = {
        // notification:{
        //     click_action:'FLUTTER_NOTIFICATION_CLICK',
        //     // "sound":"default"
        //     title:data.groupName ? data.groupName : data.fullname,
        //     body:data.groupName ? data.fullname+" : "+ data.message : data.message
        // },
        data: {
            ...data,
            "click_action": "FLUTTER_NOTIFICATION_CLICK",
        }
      };
      const option = {priority:"high", timeToLive:60*60*24,contentAvailable:true}
      firebase.messaging().sendToDevice(registrationToken,message,option)
        .then((response) => {
          // console.log(response.results);
          // console.log("response",response);
        })
        .catch((error) => {
          // console.log("error",error);
        });
}

module.exports = sendNotification;