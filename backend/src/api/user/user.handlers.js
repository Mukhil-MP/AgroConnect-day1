const { StatusCodes } = require('http-status-codes');
const services = require('./user');
const path = require("path");
const cloudinary = require("cloudinary").v2;
const fs = require("fs");
const { generateAPIError } = require('../../errors');

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


  module.exports.upload = async (req, res) => {
    if (!req.files) {
      throw generateAPIError("No files uploaded",401);
    }
    const pdf = req.files.pdf;
  
    if (!pdf.mimetype.startsWith("application/pdf")) {
      throw generateAPIError("Plz upload an pdf",401);
    }
  
    // const maxSize = 500000;
    // if (pdf.size > maxSize) {
    //   throw generateAPIError(
    //     "Plz upload pdf smaller than 500kb",401
    //   );
    // }
    const result = await cloudinary.uploader.upload(
      req.files.pdf.tempFilePath,
      {
        use_filename: true,
        folder: "agro",
      }
    );
    fs.unlinkSync(req.files.pdf.tempFilePath);

    return res.status(StatusCodes.OK).json({
      success: true,
      msg: 'Upload',
      pdf: { src: result.secure_url }
    });
  };