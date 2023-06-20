const router = require('express').Router();
const officerNotificationController = require('../controller/officerNotificationController');

router.post('/officerNotification',officerNotificationController.officernotify);


module.exports = router;