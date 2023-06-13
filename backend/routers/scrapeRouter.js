const router = require('express').Router();
const scrapeController = require('../controller/scrapeController');

router.post('/fetchdata',scrapeController.fetch);


module.exports = router;