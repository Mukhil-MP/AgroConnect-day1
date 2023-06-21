const memberService = require('../services/memberServices');
const otpService = require('../services/otpServices');

exports.register = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { name,phone,password,district,taluk,block,kb,wardno } = req.body;
        const duplicate = await memberService.getUserByPhone(phone);
        if (duplicate) {
            throw new Error(`UserName ${email}, Already Registered`)
        }
        await otpService.generateAndSendOTP(phone);
        const response = await memberService.registerMember(name,phone,password,district,taluk,block,kb,wardno);
        res.json({ status: true, success: 'member registered successfully' });
    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}