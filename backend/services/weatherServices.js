const weatherController = require('../controller/weatherController');

// Example usage
const latitude = 9.549490;
const longitude = 76.604910;
const apiKey = process.env.OPENWEATHERMAP_API_KEY;

weatherController.saveWeatherData(latitude, longitude, apiKey)
  .then(() => {
    console.log('Weather data saved successfully');
  })
  .catch((error) => {
    console.error('Error saving weather data:', error);
  });
