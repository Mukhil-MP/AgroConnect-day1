const scrapperRouter = require('express').Router();
const scrapper = require('../controller/scrapeController');

scrapperRouter.get('/fetchdata',scrapper.fetch);


module.exports = scrapperRouter;