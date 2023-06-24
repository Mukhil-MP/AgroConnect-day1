const models = require('../../models');
const { generateOtp, fast2sms } = require('./user.helpers');
const { generateAPIError } = require('../../errors');

module.exports.otpCreate = async (mobileNumber) => {
    const otp = generateOtp(4);
    console.log(otp);

    fast2sms(otp, mobileNumber);
  
    return otp;
  };

  module.exports.isRegistered = async (mobileNumber) => {
    const user = await models.User.findOne({ mobileNumber: mobileNumber });
  
    return user ? true : false;
  };

  module.exports.createUser = async (user) => {
    await models.User.create(user);
    console.log(user);

  
    return user;
  };

  module.exports.createPassword = async (mobileNumber,password)=>{
    const user = await models.User.findOne({mobileNumber:mobileNumber})
    user.password = password
    await user.save()
  }

  module.exports.loginUser = async(mobileNumber,password)=>{
    const user = await models.User.findOne({mobileNumber:mobileNumber});
    if (!user) {
        throw generateAPIError('User not found',401)
    }
    const isPasswordCorrect = await user.comparePassword(password);
    if (isPasswordCorrect === false) {
        throw generateAPIError('Wrong Password',401)
    }
    return user
  }

  module.exports.userEdit = async (mobileNumber, newDetails) => {
    const user = await models.User.findOne({ mobileNumber: mobileNumber })

  
    if (newDetails?.district) {
      user.district = newDetails?.district;
    }
    if (newDetails?.taluk) {
      user.taluk = newDetails?.taluk;
    }
  
    if (newDetails?.block) {
      user.block = newDetails?.block;
    }
    if (newDetails?.kb) {
      user.kb = newDetails?.kb;
    }
    if (newDetails?.wardno) {
      user.wardno = newDetails?.wardno;
    }
    if(newDetails?.newPassword){
      const isPasswordCorrect = await user.comparePassword(newDetails?.oldPassword);
      if (isPasswordCorrect === false) {
          throw generateAPIError('Wrong Password',401)
      }
    
      user.password=newDetails?.newPassword

    }
  
    await user.save();
  
    return user;
  };


  