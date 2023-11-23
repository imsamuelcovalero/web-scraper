// Cria um web-scraping para o site "https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops"
// e salva os dados em um arquivo json.

const puppeteer = require('puppeteer');
const fs = require('fs');

const url = 'https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops';

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto(url);

  const laptops = await page.evaluate(() => {
    const nodeList = document.querySelectorAll('.thumbnail');
    const laptopsArray = [...nodeList];

    const laptopsList = laptopsArray.map(({ innerText, innerHTML }) => {
      const title = innerText.split('\n')[0];
      const price = innerText.split('\n')[1];
      const description = innerText.split('\n')[2];
      const reviews = innerText.split('\n')[3];
      const image = innerHTML.split('src="')[1].split('"')[0];

      return {
        title,
        price,
        description,
        reviews,
        image,
      };
    });

    return laptopsList;
  });

  fs.writeFile('laptops.json', JSON.stringify(laptops, null, 2), (err) => {
    if (err) throw new Error('Something went wrong');

    console.log('Well done!');
  });

  await browser.close();
})();
