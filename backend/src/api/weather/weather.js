const axios = require('axios');
const model = require('../../models');

async function fetchData(latitude, longitude) {
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=${process.env.OPENWEATHERMAP_API_KEY}`;
  const response = await axios.get(url);
  if (response && response.data) {
    const weatherData = response.data;
    return weatherData
  } else {
    throw generateAPIError('Failed to fetch data',401)
  }
}

module.exports = { fetchData };
