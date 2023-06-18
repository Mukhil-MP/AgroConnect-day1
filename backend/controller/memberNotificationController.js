const memberNotificationService = require('../services/memberNotificationServices');

exports.membernotify = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { notificationText } = req.body;
        const response = await memberNotificationService.sendNotification(notificationText);

        res.json({ status: true, success: 'Notification sent successfully'});
    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
};
