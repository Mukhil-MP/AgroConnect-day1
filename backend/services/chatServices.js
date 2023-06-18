const chatModel = require('../model/chatModel');

class chatService {
  static async chatgroups(taluk, groupLink) {
    try {
      const newChat = new chatModel({
        taluk: taluk,
        groupLink: groupLink,
      });

      // Save the new chat to the database
      const savedChat = await newChat.save();
      console.log('Chat group saved successfully:', savedChat);
      return savedChat; // Return the saved chat object
    } catch (err) {
      console.error('Error saving chat group:', err);
      throw err;
    }
  }
}

module.exports = chatService;
