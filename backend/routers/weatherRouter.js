const express = require('express');
const router = express.Router();
const weatherController = require('../controller/weatherController');

// POST route to save weather data
router.post('/weather', weatherController.saveWeather);

module.exports = router;
