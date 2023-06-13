const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema }=mongoose;

//changed userSchema to farmerSchema
const officerSchema = new Schema({
    name: {
        type: String,
        required: [true, "name can't be empty"]
    },
    phone: {
        type: Number,
        unique: true,
        required: [true, "name can't be empty"]
    },
    password: {
        type: String,
        required: [true, "password is required"]
    },
    district: {
        type: String,
        required: [true, "district is required"]
    },
    taluk:{
        type:String,
        required: [true, "taluk is required"]
    },
    block:{
        type:String,
        required: [true, "block name is required"]
    },
    kb:{
        type:String,
        required: [true, "krishibhavan is required"]
    },
    wardno:{
        type:String,
        required: [true, "ward number is required"]
    }
},{timestamps:true});

const officerModel = db.model('officer',officerSchema);

module.exports = officerModel;