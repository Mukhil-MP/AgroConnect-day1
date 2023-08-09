const { StatusCodes } = require('http-status-codes');
const services = require('./user');
const cloudinary = require("cloudinary").v2;
const fs = require("fs");
const { generateAPIError } = require('../../errors');
const models = require('../../models');

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

  module.exports.notifyUpload = async (req, res) => {
      const notification = req.body.notification
      const mobileNumber = req.body.mobileNumber
      const user = await models.User.findOne({mobileNumber:mobileNumber})

      if(user.role==='wardMember'){
        const notifi = await models.Notification.create({wardMember:user._id,officer:null,notification:notification})
      }else{
        const notifi = await models.Notification.create({wardMember:null,officer:user._id,notification:notification})
      }

    return res.status(StatusCodes.OK).json({
      success: true,
      msg: 'notify uploaded',
    });
  };

  module.exports.notifyView = async (req, res) => {
    const mobileNumber = req.body.mobileNumber
    const user = await models.User.findOne({mobileNumber:mobileNumber})
    console.log(user)
    const wardMember = await models.User.findOne({kb:user.kb,wardno:user.wardno,role:'wardMember'})
    const officer = await models.User.findOne({kb:user.kb,role:'officer'})

    console.log(wardMember)
    console.log(officer)
    let wardMemberNotify = null
    let officerNotify = null

    if(wardMember)
      wardMemberNotify = await models.Notification.find({wardMember:wardMember?._id})
    if (officer)
      officerNotify = await models.Notification.find({officer:officer?._id})

  return res.status(StatusCodes.OK).json({
    success: true,
    msg: 'notifications',
    wardMemberNotify:wardMemberNotify,
    officerNotify:officerNotify,
    ward_no:wardMemberNotify?.length,
    officer_no:officerNotify?.length
  });
};

module.exports.complaintRegister = async (req, res) => {
  const mobileNumber = req.body.mobileNumber
  const user = await models.User.findOne({mobileNumber:mobileNumber})
  console.log(user)
  const officer = await models.User.findOne({kb:user.kb,role:"officer"})

  const complaint =  await models.Complaint.create({user:user._id,complaint:req.body.complaint,officer:officer._id})



return res.status(StatusCodes.OK).json({
  success: true,
  msg: 'Complaint Created',
  complaint:complaint
});
};

module.exports.complaintView = async (req, res) => {
  const mobileNumber = req.body.mobileNumber
  const user = await models.User.findOne({mobileNumber:mobileNumber})

  const complaints = await models.Complaint.find({user:user._id})


return res.status(StatusCodes.OK).json({
  success: true,
  msg: 'Complaints',
  complaints:complaints
});
};

module.exports.complaintViewOfficer = async (req, res) => {
  const mobileNumber = req.body.mobileNumber
  const officer = await models.User.findOne({mobileNumber:mobileNumber})
  const complaints = await models.Complaint.find({officer:officer._id}) 


return res.status(StatusCodes.OK).json({
  success: true,
  msg: 'Complaints',
  complaints:complaints
});
};

// module.exports.complaintNew = async (req, res) => {
//   const mobileNumber = req.body.mobileNumber
//   const officer = await models.User.findOne({mobileNumber:mobileNumber})
//   const newComplaints = await models.Complaint.find({officer:officer._id,complaintType:"notSeen"}) 


// return res.status(StatusCodes.OK).json({
//   success: true,
//   msg: 'New Complaints',
//   complaints: newComplaints
// });
// };


// module.exports.complaintNotRes = async (req, res) => {
//   const mobileNumber = req.body.mobileNumber
//   const officer = await models.User.findOne({mobileNumber:mobileNumber})
//   const notRepComplaints = await models.Complaint.find({officer:officer._id,complaintType:"notReplyed"}) 


// return res.status(StatusCodes.OK).json({
//   success: true,
//   msg: 'Not Replyed Complaints',
//   complaints: notRepComplaints
// });
// };

// module.exports.complaintRes = async (req, res) => {
//   const mobileNumber = req.body.mobileNumber
//   const officer = await models.User.findOne({mobileNumber:mobileNumber})
//   const repComplaints = await models.Complaint.find({officer:officer._id,complaintType:"replyed"}) 


// return res.status(StatusCodes.OK).json({
//   success: true,
//   msg: 'Not Replyed Complaints',
//   complaints: repComplaints
// });
// };



module.exports.complaintSetNotReplyed = async(req,res)=>{
  const setComplaint = await models.Complaint.findById(req.body.id)
  setComplaint.complaintType = "notReplyed"
  await setComplaint.save()

  return res.status(StatusCodes.OK).json({
    success: true,
    msg: 'Not Replyed Complaints',
    complaints: setComplaint
  });
}

module.exports.complaintGiveReply = async(req,res)=>{
  const complaint = await models.Complaint.findById(req.body.id)
  complaint.reply = req.body.reply
  complaint.complaintType = "replyed"
  await complaint.save()

  return res.status(StatusCodes.OK).json({
    success: true,
    msg: 'Replyed Complaints',
    complaints: complaint
  });
}