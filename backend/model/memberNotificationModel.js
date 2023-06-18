const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema }=mongoose;


const memberNotificationSchema = new Schema({
    notificationText: {
        type: String,
        required: [true, "notification can't be empty"]
    }
},{timestamps:true});

const memberNotificationModel = db.model('memberNotification',memberNotificationSchema);

module.exports = memberNotificationModel;