const mongoose = require('mongoose');
require('dotenv').config();

const connectionOptions = {
  useNewUrlParser: true,
  useUnifiedTopology: true,
};

mongoose.connect(process.env.DB_URL, connectionOptions)
  .then(() => {
    console.log('MongoDB Atlas Connected');
  })
  .catch((error) => {
    console.error('MongoDB Atlas Connection error:', error);
  });

module.exports = mongoose.connection;
