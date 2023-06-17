const OTPModel = require('../model/otpModel');
const farmerModel = require('../model/farmerModel');
const axios = require('axios');
require("dotenv").config();

async function generateAndSendOTP(phone) {
  const otpCode = Math.floor(1000 + Math.random() * 9000); // Generate a 4-digit OTP 
  // Save OTP to the database
  const otp = new OTPModel({
    phone:phone,
    code: otpCode,
    createdAt: new Date(),
  });
  await otp.save({ timeout: 30000 });

  // Send OTP to the farmer's mobile number using Fast2SMS API
  const apiKey = process.env.FAST2SMS_API_KEY;
  //const message = `Your OTP is ${otpCode}`;
  const url = `https://www.fast2sms.com/dev/bulkV2?authorization=${apiKey}&variables_values=${otpCode}&route=otp&numbers=${phone}`;

  try {
    await axios.get(url);
    console.log('OTP sent successfully');
  } catch (error) {
    console.error('Error sending OTP:', error.response.data);
    throw new Error('Failed to send OTP');
  }
}

module.exports = { generateAndSendOTP };
