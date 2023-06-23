const weatherService = require('../services/weatherServices');

exports.saveWeather = async (req, res, next) => {
  const { latitude, longitude, apiKey } = req.body;

  try {
    await weatherService.saveWeatherData(latitude, longitude, apiKey);
    res.status(200).json({ message: 'Weather data saved successfully' });
  } catch (error) {
    console.error('Error saving weather data:', error);
    res.status(500).json({ error: 'Failed to save weather data' });
    next(error);
  }
};



exports.getWeather = async (req, res, next) => {
  try {
    const { latitude, longitude } = req.params;
    const weatherData = await weatherService.getWeatherData(latitude, longitude);
    res.json(weatherData);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch weather data' });
    next(error);
  }
};

//rmodule.exports = { saveWeather };
