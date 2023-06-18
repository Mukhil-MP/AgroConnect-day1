const complaintModel = require('../model/complaintModel');


class complaintService{
    static async registerComplaint(complaintText){
        try{
            const createComplaint = new complaintModel({complaintText});
            return await createComplaint.save();
        }catch(err){
            throw err;
        }
    }


    static async viewComplaints() {
        try {
          return await complaintModel.find({});
        } catch (err) {
          throw err;
        }
      }
}

module.exports = complaintService;