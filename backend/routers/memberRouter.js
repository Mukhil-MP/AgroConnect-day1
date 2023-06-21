const router = require('express').Router();
const memberController = require('../controller/memberController');

router.post('/registermember',memberController.register);
router.post('/memberlogin', memberController.login);
router.post('/memberforgotPassword', memberController.forgotPassword);
router.post('/memberresetPassword', memberController.resetPassword); 

module.exports = router; 