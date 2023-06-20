const officerModel = require('../model/officerModel');

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
}

module.exports = officerService;