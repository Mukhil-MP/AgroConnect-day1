const router = require('express').Router();
const weatherController = require('../controller/weatherController');

router.post('/fetchweather',weatherController.saveWeatherData);


module.exports = router;