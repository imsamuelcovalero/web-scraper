/* File: src/index.js */
/* eslint-disable no-await-in-loop */
const puppeteer = require('puppeteer');

const sequelize = require('./database/config/database');
const Laptop = require('./database/models/Laptop');
const HddOption = require('./database/models/HddOption');

sequelize.sync({ force: true }).then(() => {
  console.log('Tabelas criadas com sucesso!');
}).catch((error) => {
  console.error('Erro ao criar tabelas:', error);
});

const url = 'https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops';

(async () => {
  // Limpando as tabelas antes de iniciar a raspagem
  // await sequelize.query('SET FOREIGN_KEY_CHECKS = 0');
  // await Laptop.destroy({ where: {}, force: true });
  // await HddOption.destroy({ where: {}, force: true });
  // await sequelize.query('SET FOREIGN_KEY_CHECKS = 1');
  // console.log('Tabelas limpas para nova raspagem.');

  // Iniciando o processo de raspagem
  const browser = await puppeteer.launch({ headless: true });
  const page = await browser.newPage();
  console.log('Acessando a página principal...');
  await page.goto(url, { waitUntil: 'networkidle0' });

  const cookieSelector = '#cookieBanner > div.acceptContainer > a';
  if (await page.$(cookieSelector) !== null) {
    console.log('Aceitando cookies...');
    await page.click(cookieSelector);
    await new Promise((r) => { setTimeout(r, 5000); });
  }

  console.log('Procurando por laptops Lenovo...');
  const laptopLinks = await page.$$eval('div.caption > h4 > a.title', (anchors) => anchors.filter((anchor) => anchor.textContent.includes('Lenovo')).map((anchor) => anchor.href));
  console.log(`Foram encontrados ${laptopLinks.length} laptops Lenovo.`);

  for (const link of laptopLinks) {
    console.log(`Acessando a página de detalhes: ${link}`);
    await page.goto(link, { waitUntil: 'networkidle0' });

    const title = await page.$eval('div.caption > h4.card-title', (el) => el.textContent.trim());

    const description = await page.$eval('p.description', (el) => el.textContent.trim());

    const basePriceText = await page.$eval('h4.price', (el) => el.textContent.trim());
    const basePrice = basePriceText.replace('$', '');

    // Cria um registro de laptop no banco de dados
    const laptop = await Laptop.create({
      title,
      description,
      basePrice: parseFloat(basePrice),
    });

    const hddButtons = await page.$$('div.swatches > button.btn.swatch:not(.disabled)');
    console.log(`Encontradas ${hddButtons.length} opções de HDD para ${title}.`);
    for (const button of hddButtons) {
      const size = await page.evaluate((el) => el.textContent.trim(), button);
      await button.click();
      await new Promise((r) => { setTimeout(r, 1000); });

      // Correção: Certifique-se de esperar pela promise de $eval antes de chamar replace
      const priceText = await page.$eval('h4.price', (el) => el.textContent.trim());
      const priceAfterClick = priceText.replace('$', '');

      // Cria um registro de HddOption associado ao laptop
      await HddOption.create({
        size,
        price: parseFloat(priceAfterClick), // Converte a string de preço para um número
        laptopId: laptop.id, // Associa a opção de HDD ao laptop
      });
    }
  }

  await browser.close();
  console.log('Dados dos laptops Lenovo foram salvos no banco de dados.');
})();
