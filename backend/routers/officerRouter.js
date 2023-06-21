const router = require('express').Router();
const officerController = require('../controller/officerController');

router.post('/registerofficer',officerController.register);
router.post('/officerlogin', officerController.login);
router.post('/officerforgotPassword', officerController.forgotPassword);
router.post('/officerresetPassword', officerController.resetPassword); 

module.exports = router;