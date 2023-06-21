const mongoose = require('mongoose');
const db = require('../config/db');
const otpSchema = new mongoose.Schema({
  phone: { type: String, required: true },
  code: { type: String, required: true },
  createdAt: { type: Date, default: Date.now, expires: 300 }, // OTP expires after 5 minutes
});

const OTPModel = db.model('OTP', otpSchema);
module.exports = OTPModel;
