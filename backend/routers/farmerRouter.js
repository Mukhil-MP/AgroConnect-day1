const router = require('express').Router();
const farmerController = require('../controller/farmerController');

router.post('/registerfarmer',farmerController.register);
router.post('/login', farmerController.login);

module.exports = router;