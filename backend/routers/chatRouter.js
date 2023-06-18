const router = require('express').Router();
const chatController = require('../controller/chatController');

router.post('/savegroups',chatController.createChat);


module.exports = router;