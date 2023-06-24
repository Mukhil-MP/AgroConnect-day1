const scrapperRouter = require('express').Router();
const scrapper = require('./scrapper.handlers')

scrapperRouter.get('/fetchdata',scrapper.fetch);


module.exports = scrapperRouter;