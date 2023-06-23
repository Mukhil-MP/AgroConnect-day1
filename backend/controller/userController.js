const farmerService = require('../services/farmerServices');
const memberService = require('../services/memberServices');
const officerService = require('../services/officerServices');
const otpService = require('../services/otpServices');
const OTPModel = require('../model/otpModel');

exports.register = async (req, res, next) => {
  try {
    console.log("---req body---", req.body);
    const { userType, name, phone, password, district, taluk, block, kb, wardno, enteredCode } = req.body;

    let response;

    if (userType === 'farmer') {
      const duplicate = await farmerService.getUserByPhone(phone);
      if (duplicate) {
        throw new Error(`UserName ${phone}, Already Registered`);
      }
      const generatedCode = await otpService.generateAndSendOTP(phone);

      if (generatedCode !== enteredCode) {
        throw new Error('Invalid OTP');
      }
      response = await farmerService.registerFarmer(name, phone, password, district, taluk, block, kb, wardno);
    } else if (userType === 'member') {
      const duplicate = await memberService.getUserByPhone(phone);
      if (duplicate) {
        throw new Error(`UserName ${phone}, Already Registered`);
      }
      const generatedCode = await otpService.generateAndSendOTP(phone);

      if (generatedCode !== enteredCode) {
        throw new Error('Invalid OTP');
      }
      response = await memberService.registerMember(name, phone, password, district, taluk, block, kb, wardno);
    } else if (userType === 'officer') {
      const duplicate = await officerService.getUserByPhone(phone);
      if (duplicate) {
        throw new Error(`UserName ${phone}, Already Registered`);
      }
      const generatedCode = await otpService.generateAndSendOTP(phone);

      if (generatedCode !== enteredCode) {
        throw new Error('Invalid OTP,  Registration failed');
      }
      response = await officerService.registerOfficer(name, phone, password, district, taluk, block, kb, wardno);
    } else {
      throw new Error('Registration failed');
    }

    res.json({ status: true, success: `${userType} registered successfully` });
  } catch (err) {
    console.log("---> err -->", err);
    next(err);
  }
};



//login checking.....................
exports.login = async (req, res, next) => {
  try {
    const { phone, password } = req.body;
    if (!phone || !password) {
      throw new Error('Credentials are not correct');
    }

    let user, userType;
    // Check farmerModel
    user = await farmerService.checkUser(phone);
    if (user) {
      userType = 'farmer';
    } else {
      // Check memberModel
      user = await memberService.checkUser(phone);
      if (user) {
        userType = 'member';
      } else {
        // Check officerModel
        user = await officerService.checkUser(phone);
        if (user) {
          userType = 'officer';
        } else {
          throw new Error('User does not exist');
        }
      }
    }

    const isPasswordCorrect = await user.comparePassword(password);
    if (!isPasswordCorrect) {
      throw new Error(`Password does not match`);
    }

    // Creating Token
    const tokenData = { _id: user._id, phone: user.phone, userType };
    const token = await farmerService.generateAccessToken(tokenData, "secret", "1h");

    res.status(200).json({ status: true, success: "login successfull", token: token ,userType:userType});
  } catch (error) {
    console.log(error, 'err---->');
    next(error);
  }
};


// Forgot Password
exports.forgotPassword = async (req, res, next) => {
    try {
      const { phone } = req.body;
      const user = await farmerService.getUserByPhone(phone);
  
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
      const user = await farmerService.getUserByPhone(phone);
  
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
  