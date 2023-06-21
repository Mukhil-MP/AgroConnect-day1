const officerModel = require('../model/officerModel');
const jwt = require("jsonwebtoken");

class officerService{
    static async registerOfficer(name,phone,password,district,taluk,block,kb,wardno){
        try{
            const createOfficer = new officerModel({name,phone,password,district,taluk,block,kb,wardno});
            return await createOfficer.save();
        }catch(err){
            throw err;
        }
    }

    static async getUserByPhone(phone){
        try{
            return await officerModel.findOne({phone});
        }catch(err){
            console.log(err);
        }
    }

    static async checkUser(phone){
        try {
            return await officerModel.findOne({phone});
        } catch (error) {
            throw error;
        }
    }

    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }


};

module.exports = officerService;