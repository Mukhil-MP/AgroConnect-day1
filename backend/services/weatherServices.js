const axios = require('axios');
const weatherModel = require('../model/weatherModel');
require('dotenv').config();

class weatherService {
  static async saveWeatherData(latitude, longitude, apiKey) {
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${apiKey}`;

    try {
      const response = await axios.get(url);

      if (response && response.data) {
        const weatherData = response.data;

        // Extract the nested "sys" field properties
        const { type, id, country, sunrise, sunset } = weatherData.sys;

        // Create a new Weather object using the weather data
        const weather = new weatherModel({
          ...weatherData,
          sys: {
            type,
            id,
            country,
            sunrise,
            sunset,
          },
        });

        await weather.save();

        console.log('Weather data saved successfully');
      } else {
        throw new Error('Failed to retrieve weather data');
      }
    } catch (error) {
      console.error('Error saving weather data:', error.message);
      throw new Error('Failed to save weather data');
    }
  }

  static async getWeatherData(latitude, longitude) {
    try {
      const weatherData = await weatherModel.findOne({ latitude, longitude }).sort({ _id: -1 }).exec();

      if (!weatherData) {
        throw new Error('No weather data found for the provided latitude and longitude');
      }

      return weatherData;
    } catch (error) {
      console.error('Error fetching weather data:', error.message);
      //throw new Error('Failed to fetch weather data');
    }
  }
}

module.exports = weatherService;
