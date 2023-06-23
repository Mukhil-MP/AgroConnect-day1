const router = require('express').Router();
const userController = require('../controller/userController');

router.post('/registeruser',userController.register);
router.post('/login', userController.login);
router.post('/farmerforgotPassword', userController.forgotPassword);
router.post('/farmerresetPassword', userController.resetPassword); 

module.exports = router;