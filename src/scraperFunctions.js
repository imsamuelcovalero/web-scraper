/* File: src/scraperFunctions.js */
require('dotenv').config();
const puppeteer = require('puppeteer');
const fs = require('fs');
const mysqldump = require('mysqldump');
const sequelize = require('./database/config/database');
const Laptop = require('./database/models/Laptop');
const HddOption = require('./database/models/HddOption');

const url = 'https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops';

exports.scrapeAndSave = async function () {
  (async () => {
    sequelize.sync({ force: true }).then(() => {
      console.log('Tabelas criadas com sucesso!');
    }).catch((error) => {
      console.error('Erro ao criar tabelas:', error);
    });
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
};

exports.exportMySQLtoJSON = async function () {
  try {
    const count = await Laptop.count();
    if (count === 0) {
      throw new Error('Nenhum dado encontrado no banco de dados.');
    }

    const laptops = await Laptop.findAll({
      include: [{
        model: HddOption,
        attributes: ['size', 'price'],
      }],
      attributes: ['title', 'description', 'basePrice'],
    });

    const formattedData = laptops.map((laptop) => ({
      title: laptop.title,
      description: laptop.description,
      basePrice: `$${laptop.basePrice}`, // Adiciona o símbolo de dólar
      hddOptions: laptop.hddOptions.map((option) => ({
        size: option.size,
        price: `$${option.price}`, // Adiciona o símbolo de dólar
      })),
    }));

    fs.writeFileSync('lenovo-laptops.json', JSON.stringify(formattedData, null, 2));
    console.log('Dados exportados do MySQL para JSON com sucesso.');
  } catch (error) {
    console.error('Erro ao exportar dados do MySQL para JSON:', error);
  }
};

exports.generateJSON = async function () {
  (async () => {
    const browser = await puppeteer.launch({ headless: true }); // Modo headless desativado
    const page = await browser.newPage();
    console.log('Acessando a página principal...');
    await page.goto(url, { waitUntil: 'networkidle0' }); // Espera até que a rede esteja ociosa

    // Lidar com a solicitação de cookies, se presente
    const cookieSelector = '#cookieBanner > div.acceptContainer > a';
    if (await page.$(cookieSelector) !== null) {
      console.log('Aceitando cookies...');
      await page.click(cookieSelector);

      // Espera um tempo fixo para que qualquer ação do clique seja concluída
      // await page.waitForTimeout(5000); // espera 5 segundos
      await new Promise((r) => { setTimeout(r, 5000); }); // espera 5 segundos
    }

    // Coleta os links dos laptops Lenovo
    console.log('Procurando por laptops Lenovo...');
    const laptopLinks = await page.$$eval('div.caption > h4 > a.title', (anchors) => anchors.filter((anchor) => anchor.textContent.includes('Lenovo')).map((anchor) => anchor.href));
    console.log(`Foram encontrados ${laptopLinks.length} laptops Lenovo.`);

    const laptopsData = [];

    for (const link of laptopLinks) {
      console.log(`Acessando a página de detalhes: ${link}`);
      await page.goto(link, { waitUntil: 'networkidle0' }); // Espera até que a rede esteja ociosa

      const title = await page.$eval('div.caption > h4.card-title', (el) => el.textContent.trim());
      const description = await page.$eval('p.description', (el) => el.textContent.trim());
      const basePrice = await page.$eval('h4.price', (el) => el.textContent.trim());
      console.log(`Coletando dados do laptop: ${title}`);

      const hddOptions = [];
      const hddButtons = await page.$$('div.swatches > button.btn.swatch:not(.disabled)');
      console.log(`Encontradas ${hddButtons.length} opções de HDD.`);
      for (const button of hddButtons) {
        const size = await page.evaluate((el) => el.textContent.trim(), button);
        console.log(`Clicando na opção de HDD: ${size}`);
        await button.click();
        await new Promise((r) => { setTimeout(r, 1000); });

        const priceAfterClick = await page.$eval('h4.price', (el) => el.textContent.trim());
        console.log(`Preço para HDD ${size}: ${priceAfterClick}`);
        hddOptions.push({ size, price: priceAfterClick });
      }

      laptopsData.push({
        title, description, basePrice, hddOptions,
      });
    }

    await browser.close();
    fs.writeFileSync('lenovo-laptops.json', JSON.stringify(laptopsData, null, 2));
    console.log('Dados dos laptops Lenovo foram salvos.');
  })();
};

exports.generateSQL = async function () {
  try {
    const count = await Laptop.count();
    if (count === 0) {
      throw new Error('Nenhum dado encontrado no banco de dados.');
    }

    await mysqldump({
      connection: {
        host: 'localhost',
        user: 'root',
        password: process.env.MYSQL_PASSWORD,
        database: 'web-scraper-db',
      },
      dumpToFile: './lenovo_laptops.sql',
    });
  } catch (error) {
    console.error('Erro ao gerar arquivo SQL:', error);
  }
};
