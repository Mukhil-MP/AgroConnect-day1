const complaintService = require('../services/complaintServices');



exports.complaint = async (req, res, next) => {
    try {
        console.log("---req body---", req.body);
        const { complaintText } = req.body;
        const response = await complaintService.registerComplaint(complaintText);

        res.json({ status: true, success: 'Complaint registered successfully'});
    } catch (err) {
        console.log("---> err -->", err);
        next(err);
    }
}



exports.viewComplaints = async (req, res, next) => {
  try {
    // Fetch all existing complaints
    const allComplaints = await complaintService.viewComplaints();
    console.log("Existing complaints:", allComplaints);
  } catch (err) {
    console.log("---> err -->", err);
    next(err);
  }
};

