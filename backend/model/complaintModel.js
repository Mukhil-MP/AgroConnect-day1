const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema }=mongoose;

//changed userSchema to farmerSchema
const complaintSchema = new Schema({
    complaintText: {
        type: String,
        required: [true, "complaint can't be empty"]
    }
},{timestamps:true});

const complaintModel = db.model('complaint',complaintSchema);

module.exports = complaintModel;