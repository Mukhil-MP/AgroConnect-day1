const { StatusCodes } = require('http-status-codes');
const services = require('./weather');

async function fetchWeather(req, res) {
  const { latitude, longitude} = req.body;

    const data = await services.fetchData(latitude, longitude);
    return res.status(StatusCodes.CREATED).json({
        success: true,
        msg: 'data sended',
        data: data
      });

}

module.exports = { fetchWeather };