const services = require('./scrapper');

module.exports.fetch = async (req, res, next) => {
        const response = await services.scrapperFetch();
        return res.status(StatusCodes.CREATED).json({
            success: true,
            msg: 'Data',
          });
}