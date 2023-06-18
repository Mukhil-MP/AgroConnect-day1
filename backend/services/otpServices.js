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
/*         commenting code to save otp to database

const otp = new OTPModel({
            phone:phone,
            code: otpCode,
            createdAt: new Date(),
          });
         otp.save({ timeout: 30000 });
            return await OTPModel.save();
             */
        }catch(err){
            throw err;
        }
    }
}

module.exports = otpService;