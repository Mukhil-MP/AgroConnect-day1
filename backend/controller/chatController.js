const chatService = require('../services/chatServices');

exports.createChat = async (req, res, next) => {
  try {
    console.log("---req body---", req.body);
    const { taluk, groupLink } = req.body; // Get taluk and groupLink from the request body
    const savedChat = await chatService.chatgroups(taluk, groupLink);

    res.json({ status: true, success: 'Group saved successfully', data: savedChat });
  } catch (err) {
    console.log("---> err -->", err);
    next(err);
  }
}
