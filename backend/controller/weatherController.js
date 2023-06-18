const weatherServices = require('../services/weatherServices');

async function saveWeather(req, res) {
  const { latitude, longitude, apiKey } = req.body;

  try {
    await weatherServices.saveWeatherData(latitude, longitude, apiKey);
    res.status(200).json({ message: 'Weather data saved successfully' });
  } catch (error) {
    console.error('Error saving weather data:', error);
    res.status(500).json({ error: 'Failed to save weather data' });
  }
}

module.exports = { saveWeather };
