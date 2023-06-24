const services = require('./weather');

async function saveWeather(req, res) {
  const { latitude, longitude} = req.body;

    const data = await services.saveWeatherData(latitude, longitude);
    return res.status(StatusCodes.CREATED).json({
        success: true,
        msg: 'data sended',
        data:data
      });

}

module.exports = { saveWeather };