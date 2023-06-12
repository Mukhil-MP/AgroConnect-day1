const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const scrapeSchema = new Schema(
  {
    data: {
      type: Array,
      default:[],
      required: [true, "Data can't be empty"],
    },
  },
  { timestamps: true }
);

const scrapeModel = db.model('Scrape', scrapeSchema);

module.exports = scrapeModel;
