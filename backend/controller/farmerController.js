const farmerService = require('../services/farmerServices');
const otpService = require('../services/otpServices');

exports.register = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { name,phone,password,district,taluk,block,kb,wardno } = req.body;
        const duplicate = await farmerService.getUserByPhone(phone);
        if (duplicate) {
            throw new Error(`UserName ${phone}, Already Registered`)
        }
        await otpService.generateAndSendOTP(phone);
        const response = await farmerService.registerFarmer(name,phone,password,district,taluk,block,kb,wardno);

        res.json({ status: true, success: 'Farmer registered successfully'});
    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}

//login checking.....................
exports.login = async (req, res, next) => {
    try {
        const { phone, password } = req.body;
        if (!phone || !password) {
            throw new Error('credentials are not correct');
        }
        let user = await farmerService.checkUser(phone);
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
    
        const token = await farmerService.generateAccessToken(tokenData,"secret","1h")
        res.status(200).json({ status: true, success: "sendData", token: token });
    } catch (error) {
        console.log(error, 'err---->');
        next(error);
    }
}