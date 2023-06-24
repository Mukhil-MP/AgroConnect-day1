const express = require('express');
const weatherRouter = express.Router();
const weather = require('./weather.handlers');


weatherRouter.post('/weather', weather.saveWeather);

module.exports = weatherRouter;