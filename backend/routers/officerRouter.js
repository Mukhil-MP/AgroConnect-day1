const router = require('express').Router();
const officerController = require('../controller/officerController');

router.post('/registerofficer',officerController.register);

module.exports = router;