const router = require('express').Router();
const complaintController = require('../controller/complaintController');

router.post('/registercomplaint',complaintController.complaint);
router.post('/viewcomplaint',complaintController.viewComplaints);

module.exports = router;