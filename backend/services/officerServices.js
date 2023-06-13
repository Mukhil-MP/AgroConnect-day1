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
}

module.exports = officerService;