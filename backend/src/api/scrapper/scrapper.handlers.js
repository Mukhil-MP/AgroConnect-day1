const { StatusCodes } = require('http-status-codes');
const services = require('./scrapper');

module.exports.fetch = async (req, res, next) => {
        const data = await services.scrapeWebsite();
        return res.status(StatusCodes.CREATED).json({
            success: true,
            msg: 'Notifications data',
            data:data
          });
}