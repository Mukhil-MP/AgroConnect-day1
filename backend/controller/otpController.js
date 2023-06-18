const otpService = require('../services/otpServices');

exports.otp = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { phone } = req.body;
        const response = await otpService.generateAndSendOTP(phone);

        res.json({ status: true, success: 'OTP sent successfully'});
    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}