const memberNotificationModel = require('../model/memberNotificationModel');


class memberNotificationService{
    static async sendNotification(notificationText){
        try{
            const createNotification = new memberNotificationModel({notificationText});
            return await createNotification.save();
        }catch(err){
            throw err;
        }
    }
}

module.exports = memberNotificationService;