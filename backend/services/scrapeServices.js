const axios = require('axios');
const cheerio = require('cheerio');
const scrapeModel = require('../model/scrapeModel');

class scrapeService {
  static async getData() {
    try {
      const url = 'https://keralaagriculture.gov.in/en/10951-2/';
      const response = await axios.get(url);
      const html = response.data;
      const $ = cheerio.load(html);
      const englishTextArray = [];

      $('marquee a').each((index, element) => {
        const text = $(element).text();
          englishTextArray.push(text);

      });
      const createNotification = new scrapeModel({ data: englishTextArray });
      return await createNotification.save();      
    } catch (err) {
      throw err;
    }
  }
}

/* function isEnglishText(text) {
  // Assuming that English text contains only alphanumeric characters and common punctuation
  const regex = /^[a-zA-Z0-9\s.,!?'"()]+$/;
  return regex.test(text);
} */

module.exports = scrapeService;
