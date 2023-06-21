const router = require('express').Router();
const farmerController = require('../controller/farmerController');

router.post('/registerfarmer',farmerController.register);
router.post('/login', farmerController.login);
router.post('/forgotPassword', farmerController.forgotPassword);
router.post('/resetPassword', farmerController.resetPassword); 

module.exports = router;