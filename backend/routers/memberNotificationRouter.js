const router = require('express').Router();
const memberNotificationController = require('../controller/memberNotificationController');

router.post('/memberNotification',memberNotificationController.membernotify);


module.exports = router;