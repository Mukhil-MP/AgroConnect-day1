const router = require('express').Router();
const memberController = require('../controller/memberController');

router.post('/registermember',memberController.register);

module.exports = router; 