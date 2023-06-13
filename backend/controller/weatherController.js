const weatherModel = require('../model/weatherModel');
const axios = require('axios');
require('dotenv').config();

async function saveWeatherData(latitude, longitude, apiKey) {
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${process.env.OPENWEATHERMAP_API_KEY}`;

  try {
    const response = await axios.get(url);
    const weatherData = response.data;

    // Create a new Weather object using the weather data
    const weather = new weatherModel(weatherData);
    await weather.save();

    console.log('Weather data saved successfully');
  } catch (error) {
    console.error('Error saving weather data:', error.response.data);
    throw new Error('Failed to save weather data');
  }
}

module.exports = { saveWeatherData };
