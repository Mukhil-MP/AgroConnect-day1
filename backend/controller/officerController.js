const officerService = require('../services/officerServices');
const otpService = require('../services/otpServices');
const OTPModel = require('../model/otpModel');

exports.register = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { name,phone,password,district,taluk,block,kb,wardno } = req.body;
        const duplicate = await officerService.getUserByPhone(phone);
       if (duplicate) {
            throw new Error(`UserName ${email}, Already Registered`)
        }
        await otpService.generateAndSendOTP(phone);
        const response = await officerService.registerOfficer(name,phone,password,district,taluk,block,kb,wardno);
        res.json({ status: true, success: 'Krishi Officer registered successfully' });
    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
};


exports.login = async (req, res, next) => {
    try {
        const { phone, password } = req.body;
        if (!phone || !password) {
            throw new Error('credentials are not correct');
        }
        let user = await officerService.checkUser(phone);
        if (!user) {
            throw new Error('Username error or user does not exist');
        }
        const isPasswordCorrect = await user.comparePassword(password);
        if (isPasswordCorrect === false) {
            throw new Error(`Password does not match`);
        }
        // Creating Token
        let tokenData;
        tokenData = { _id: user._id, phone: user.phone };
    
        const token = await officerService.generateAccessToken(tokenData,"secret","1h")
        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
};

// Forgot Password
exports.forgotPassword = async (req, res, next) => {
    try {
      const { phone } = req.body;
      const user = await officerService.getUserByPhone(phone);
  
      if (!user) {
        throw new Error('User not found');
      }
  
      // Generate and send OTP
      //const otpCode = await otpService.generateAndSendOTP(phone);
      await otpService.generateAndSendOTP(phone);
  
      // Save OTP to user's document or any other storage as needed
     // user.otp = otpCode;
      await user.save();
  
      res.json({ status: true, message: 'OTP for password reset sent successfully' });
    } catch (err) {
      console.log("---> err -->", err);
      next(err);
    }
  };

  // Reset Password
exports.resetPassword = async (req, res, next) => {
    try {
      const { phone, otp, newPassword } = req.body;
      const user = await officerService.getUserByPhone(phone);
  
      if (!user) {
        throw new Error('User not found');
      }
  
      // Verify OTP
      const savedOTP = await OTPModel.findOne({ phone: phone, code: otp }).sort({ createdAt: -1 });
  
      if (!savedOTP) {
        throw new Error('Invalid OTP');
      }
  
      // Check OTP validity (e.g., within a certain time limit)

  
      // Update user's password
      user.password = newPassword;
      await user.save();
  
      // Delete the used OTP
      await OTPModel.findOneAndDelete({ phone });
  
      res.json({ status: true, message: 'Password reset successfully' });
    } catch (err) {
      console.log("---> err -->", err);
      next(err);
    }
  };
  