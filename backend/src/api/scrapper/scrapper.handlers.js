const { StatusCodes } = require('http-status-codes');
const services = require('./scrapper');

module.exports.fetch = async (req, res, next) => {
        const data = await services.scrapperFetch();
        return res.status(StatusCodes.CREATED).json({
            success: true,
            msg: 'Notications data',
            data:data
          });
}