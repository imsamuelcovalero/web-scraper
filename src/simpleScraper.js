// Apenas para referência futura, esta opção de raspagem é mais simples
// e pega as informações de uma página, porém não faz a navegação, consultando os detalhes.
const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');

const url = 'https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops';

axios.get(url)
  .then((response) => {
    const html = response.data;
    const $ = cheerio.load(html);
    const laptops = [];

    $('div.thumbnail').each((i, elem) => {
      const brand = $(elem).find('.title').text().split(' ')[0];
      if (brand === 'Lenovo') {
        const title = $(elem).find('.title').text();
        const price = $(elem).find('.price').text();
        const description = $(elem).find('.description').text();

        laptops.push({
          title,
          price,
          description,
        });
      }
    });

    return laptops;
  })
  .then((laptops) => {
    fs.writeFileSync('lenovo-laptops.json', JSON.stringify(laptops, null, 2));
    console.log('Dados salvos em lenovo-laptops.json');
  })
  .catch((error) => {
    console.error(`Houve um erro na requisição: ${error}`);
  });
