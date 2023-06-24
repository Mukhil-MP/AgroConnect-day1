const express = require('express');
const weatherRouter = express.Router();
const weather = require('./weather.handlers');


weatherRouter.get('/data', weather.fetchWeather);

module.exports = weatherRouter;