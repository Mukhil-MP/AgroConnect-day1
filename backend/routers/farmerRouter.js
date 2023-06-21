const router = require('express').Router();
const farmerController = require('../controller/farmerController');

router.post('/registerfarmer',farmerController.register);
router.post('/farmerlogin', farmerController.login);
router.post('/farmerforgotPassword', farmerController.forgotPassword);
router.post('/farmerresetPassword', farmerController.resetPassword); 

module.exports = router;