const mongoose = require('mongoose');
const bcrypt = require("bcryptjs");



const NotificationSchema = new mongoose.Schema({
    wardMember:{
        type: mongoose.Types.ObjectId,
        ref: 'User'
    },
    officer:{
        type: mongoose.Types.ObjectId,
        ref: 'User'
    },
    notification:{
        type:String,
    }
},{timestamps:true});



module.exports= mongoose.model('Notification',NotificationSchema);

