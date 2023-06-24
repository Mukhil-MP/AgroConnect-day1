const { StatusCodes } = require('http-status-codes');
const services = require('./user');

module.exports.signup = async (req, res) => {
    const mobileNumber = req.body.mobileNumber;
    const isRegistered = await services.isRegistered(mobileNumber);
    if(isRegistered){
      return res.status(StatusCodes.CREATED).json({
        success: true,
        msg: 'User present',
        isRegistered:isRegistered
      });
    }else{
      const otp = await services.otpCreate(mobileNumber);
      return res.status(StatusCodes.CREATED).json({
        success: true,
        msg: 'OTP Send',
        otp: otp,
        isRegistered:isRegistered
      });
    }

  };

  module.exports.create = async (req, res) => {
    const user = await services.createUser(req.body);
  
    return res.status(StatusCodes.CREATED).json({
      success: true,
      msg: 'User Created',
      user: user
    });
  };

  module.exports.passwordCreate = async (req,res)=>{
    await services.createPassword(req.body.mobileNumber,req.body.password)
    return res.status(StatusCodes.CREATED).json({
        success: true,
        msg: 'Password Saved',
      });
  }

  module.exports.login = async(req,res)=>{
    const user = await services.loginUser(req.body.mobileNumber,req.body.password)
    return res.status(StatusCodes.CREATED).json({
        success: true,
        msg: 'Logged In',
        user:user
      });
  }

  module.exports.edit = async (req, res) => {
    const user = await services.userEdit(req.body.mobileNumber, req.body);
  
    return res.status(StatusCodes.OK).json({
      success: true,
      msg: 'User Updated',
      user: user
    });
  };


  