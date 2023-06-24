const models = require('../../models');
const { generateOtp, fast2sms } = require('./user.helpers');
const { generateAPIError } = require('../../errors');
const { passwordCreate } = require('./user.handlers');

module.exports.otpCreate = async (mobileNumber) => {
    const otp = generateOtp(6);
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
    let user = await models.User.findOne({mobileNumber:mobileNumber});
    if (!user) {
        throw generateAPIError('User not found',402)
    }
    const isPasswordCorrect = await user.comparePassword(password);
    if (isPasswordCorrect === false) {
        throw generateAPIError('Wrong Password',401)
    }
    return user
  }

  module.exports.userEdit = async (mobileNumber, newDetails) => {
    const user = await models.User.findOne({ mobileNumber: mobileNumber })
  
    if (newDetails.district) {
      user.address = newDetails.address;
    }
    if (newDetails.taluk) {
      user.pinCode = newDetails.pinCode;
    }
  
    if (newDetails.block) {
      user.district = newDetails.district;
    }
    if (newDetails.kb) {
      user.state = newDetails.state;
    }
    if (newDetails.wardno) {
      user.dob = newDetails.dob;
    }
    if(newDetails.newPassword){
        const isPasswordCorrect = await user.comparePassword(newDetails.oldPassword);
        if (isPasswordCorrect === false) {
            throw generateAPIError('Wrong Password',401)
        }
        if(isPasswordCorrect===true){
            user.password=newDetails.password
        }
    }
  
    await user.save();
  
    return user;
  };


  