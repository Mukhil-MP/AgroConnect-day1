const router = require('express').Router();
const otpController = require('../controller/otpController');


router.post("/otp/send", otpController.generateAndSendOTP);

module.exports = router;