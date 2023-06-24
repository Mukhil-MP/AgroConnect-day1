const axios = require('axios');
const cheerio = require('cheerio');

module.exports.scrapperFetch=async()=> {
      const url = 'https://keralaagriculture.gov.in/en/10951-2/';
      const response = await axios.get(url);
      const html = response.data;
      const $ = cheerio.load(html);
      const englishTextArray = [];

      $('marquee a').each((index, element) => {
        const text = $(element).text();
          englishTextArray.push(text);

      });
    return englishTextArray    
  }
