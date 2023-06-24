const axios = require('axios');
const cheerio = require('cheerio');

// Function to scrape the website for news headlines and PDF links
async function scrapeWebsite() {
  try {
    const baseUrl = 'https://keralaagriculture.gov.in';
    const url = 'https://keralaagriculture.gov.in/en/10951-2/'; // Replace with the URL of the website you want to scrape
    const response = await axios.get(url);
    const html = response.data;
    const $ = cheerio.load(html);

    const newsData = [];

    // Extract headlines and PDF links from the HTML
    $('marquee a').each((index, element) => {
      const headline = $(element).text();
      const pdfLink = baseUrl + $(element).attr('href');

      const newsItem = {
        headline,
        pdfLink,
      };

      newsData.push(newsItem);
    });

    // Process the extracted data further or return it
    console.log(newsData);
    return newsData
  } catch (error) {
    console.error('Error scraping website:', error);
  }
}

// Invoke the scraping function
module.exports = {scrapeWebsite}

