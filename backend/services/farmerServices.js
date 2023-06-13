const farmerModel = require('../model/farmerModel');
const jwt = require("jsonwebtoken");

class farmerService{
    static async registerFarmer(name,phone,password,district,taluk,block,kb,wardno){
        try{
            const createFarmer = new farmerModel({name,phone,password,district,taluk,block,kb,wardno});
            return await createFarmer.save();
        }catch(err){
            throw err;
        }
    }


    static async getUserByPhone(phone){
        try{
            return await farmerModel.findOne({phone});
        }catch(err){
            console.log(err);
        }
    }

    static async checkUser(phone){
        try {
            return await farmerModel.findOne({phone});
        } catch (error) {
            throw error;
        }
    }

    static async generateAccessToken(tokenData,JWTSecret_Key,JWT_EXPIRE){
        return jwt.sign(tokenData, JWTSecret_Key, { expiresIn: JWT_EXPIRE });
    }
}

module.exports = farmerService;