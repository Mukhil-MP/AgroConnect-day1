const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema }=mongoose;


const chatSchema = new Schema({
  taluk: {
    type: String,
    required: true,
  },
  groupLink: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

const chatModel = db.model('chat',chatSchema);

module.exports = chatModel;
