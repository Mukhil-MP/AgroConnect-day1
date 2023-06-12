//const otpModel = require('../model/otpModel');
//const fast2sms = require('fast-two-sms');
/* 
exports.generateOTP = async (req, res, next) => {
    try {
    const otp = generateOTP(6);
    // send otp to phone number
    await fast2sms(
      {
        message: `Your OTP is ${otp}`,
        contactNumber: user.phone,
      },
      next
    );
  } catch (error) {
    next(error);
  }
};
 */
/* function generateOTP(otpLength) {
  var digits = "0123456789";
  let OTP = "";
  for (let i = 0; i < otpLength; i++) {
    OTP += digits[Math.floor(Math.random() * 10)];
  }
  return OTP;
}

module.exports = {
  generateOTP,
};
 */