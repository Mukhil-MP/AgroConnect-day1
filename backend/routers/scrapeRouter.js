const router = require('express').Router();
const scrapeController = require('../controller/scrapeController');

router.post('/fetchdata',scrapeController.fetch);
router.get('/display',scrapeController.display);

module.exports = router;