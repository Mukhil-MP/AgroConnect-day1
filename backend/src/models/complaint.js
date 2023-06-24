const mongoose = require('mongoose');
const bcrypt = require("bcryptjs");



const ComplaintSchema = new mongoose.Schema({
    complaint:{
        type: String
    },
    officer:{
        type: mongoose.Types.ObjectId,
        ref: 'User'
    },
    user:{
        type: mongoose.Types.ObjectId,
        ref: 'User'
    },
    reply:{
        type:String
    },
    complaintType:{
        type:String,
        enum:["notReplyed","replyed","notSeen"],
        default:"notSeen"
    }
},{timestamps:true});



module.exports= mongoose.model('Complaint',ComplaintSchema);

