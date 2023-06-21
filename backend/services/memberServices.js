const memberModel = require('../model/memberModel');
const jwt = require("jsonwebtoken");

class memberService{
    static async registerMember(name,phone,password,district,taluk,block,kb,wardno){
        try{
            const createMember = new memberModel({name,phone,password,district,taluk,block,kb,wardno});
            return await createMember.save();
        }catch(err){
            throw err;
        }
    }

    static async getUserByPhone(phone){
        try{
            return await memberModel.findOne({phone});
        }catch(err){
            console.log(err);
        }
    }

    static async checkUser(phone){
        try {
            return await memberModel.findOne({phone});
        } catch (error) {
            throw error;
        }
    }

    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }


};

module.exports = memberService;