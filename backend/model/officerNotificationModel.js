const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema }=mongoose;


const officerNotificationSchema = new Schema({
    notificationText: {
        type: String,
        required: [true, "notification can't be empty"]
    }
},{timestamps:true});

const officerNotificationModel = db.model('officerNotification',officerNotificationSchema);

module.exports = officerNotificationModel;