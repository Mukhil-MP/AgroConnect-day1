const OTPModel = require('../model/otpModel');
require("dotenv").config();
const fast2sms = require('fast-two-sms');

class otpService{
    static async generateAndSendOTP(phone){
        try{
          const otpCode = Math.floor(1000 + Math.random() * 9000); // Generate a 4-digit OTP 
          var options = {
            authorization : process.env.FAST2SMS_API_KEY , 
            message : 'Your OTP is '+otpCode ,  
            numbers : [phone]
          } 
          fast2sms.sendMessage(options) //Asynchronous Function.
          .then(response=>{
            console.log(response)
          })
          .catch(err=>{
            console.log(err)
          })


          const otp = new OTPModel({
             phone:phone,
             code: otpCode,
             createdAt: new Date(),
          });
           otp.save({ timeout: 30000 });// otp deletes after 5 minutes
           return otpCode;
        }catch(err){
            throw err;
        }
    }

    static async verifyOTP(phone, otpCode) {
      try {
        const savedOTP = await OTPModel.findOne({ phone, code: otpCode });
        if (savedOTP) {
          // OTP is correct
          //await savedOTP.remove(); // Remove the OTP from the database after verification
          return true;
        } else {
          // OTP is incorrect or expired
          return false;
        }
      } catch (err) {
        throw err;
      }
    }
}

module.exports = otpService;