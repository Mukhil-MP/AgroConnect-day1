const officerNotificationModel = require('../model/officerNotificationModel');


class officerNotificationService{
    static async sendNotification(notificationText){
        try{
            const createNotification = new officerNotificationModel({notificationText});
            return await createNotification.save();
        }catch(err){
            throw err;
        }
    }
}

module.exports = officerNotificationService;