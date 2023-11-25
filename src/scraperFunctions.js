/* File: src/scraperFunctions.js */
require('dotenv').config();
const puppeteer = require('puppeteer');
const fs = require('fs');
const mysqldump = require('mysqldump');
const sequelize = require('./database/config/database');
const Laptop = require('./database/models/Laptop');
const HddOption = require('./database/models/HddOption');

// URL da página de raspagem
const url = 'https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops';

// Função para raspar dados e salvar no banco MySQL
exports.scrapeAndSave = async function () {
  console.log('scrapeAndSave foi chamado');
  (async () => {
    // Sincronizando e criando tabelas no banco de dados
    sequelize.sync({ force: true }).then(() => {
      console.log('Tabelas criadas com sucesso!');
    }).catch((error) => {
      console.error('Erro ao criar tabelas:', error);
    });

    // Configurando Puppeteer para iniciar a raspagem
    const browser = await puppeteer.launch({ headless: 'new' });
    const page = await browser.newPage();
    console.log('Acessando a página principal...');
    await page.goto(url, { waitUntil: 'networkidle0' });

    // Aceitando cookies se necessário
    const cookieSelector = '#cookieBanner > div.acceptContainer > a';
    if (await page.$(cookieSelector) !== null) {
      console.log('Aceitando cookies...');
      await page.click(cookieSelector);
      await new Promise((r) => { setTimeout(r, 5000); });
    }

    // Raspagem de dados específicos (laptops Lenovo)
    console.log('Procurando por laptops Lenovo...');
    const laptopLinks = await page.$$eval('div.caption > h4 > a.title', (anchors) => anchors.filter((anchor) => anchor.textContent.includes('Lenovo')).map((anchor) => anchor.href));
    console.log(`Foram encontrados ${laptopLinks.length} laptops Lenovo.`);

    // Processamento de cada laptop encontrado
    for (const link of laptopLinks) {
      console.log(`Acessando a página de detalhes: ${link}`);
      await page.goto(link, { waitUntil: 'networkidle0' });

      // Extração de dados detalhados de cada laptop
      const title = await page.$eval('div.caption > h4.card-title', (el) => el.textContent.trim());
      const description = await page.$eval('p.description', (el) => el.textContent.trim());
      const basePriceText = await page.$eval('h4.price', (el) => el.textContent.trim());
      const basePrice = basePriceText.replace('$', '');

      // Salvando dados no banco de dados
      const laptop = await Laptop.create({
        title,
        description,
        basePrice: parseFloat(basePrice),
      });

      // Processamento das opções de HDD disponíveis
      const hddButtons = await page.$$('div.swatches > button.btn.swatch:not(.disabled)');
      console.log(`Encontradas ${hddButtons.length} opções de HDD para ${title}.`);
      for (const button of hddButtons) {
        const size = await page.evaluate((el) => el.textContent.trim(), button);
        await button.click();
        await new Promise((r) => { setTimeout(r, 1000); });

        // Extração do preço após a seleção da opção de HDD
        const priceText = await page.$eval('h4.price', (el) => el.textContent.trim());
        const priceAfterClick = priceText.replace('$', '');

        // Salvando opção de HDD no banco de dados
        await HddOption.create({
          size,
          price: parseFloat(priceAfterClick),
          laptopId: laptop.id,
        });
      }
    }

    // Fechando o navegador após a raspagem
    await browser.close();
    console.log('Dados dos laptops Lenovo foram salvos no banco de dados.');
  })();
};

// Função para exportar dados do MySQL para JSON
exports.exportMySQLtoJSON = async function () {
  try {
    const count = await Laptop.count();
    if (count === 0) {
      throw new Error('Nenhum dado encontrado no banco de dados.');
    }

    // Consulta para recuperar dados de laptops e suas opções de HDD
    const laptops = await Laptop.findAll({
      include: [{
        model: HddOption,
        attributes: ['size', 'price'],
      }],
      attributes: ['title', 'description', 'basePrice'],
    });

    // Formatando dados para JSON
    const formattedData = laptops.map((laptop) => ({
      title: laptop.title,
      description: laptop.description,
      basePrice: `$${laptop.basePrice}`,
      hddOptions: laptop.hddOptions.map((option) => ({
        size: option.size,
        price: `$${option.price}`,
      })),
    }));

    // Salvando dados formatados em um arquivo JSON
    fs.writeFileSync('lenovo-laptops.json', JSON.stringify(formattedData, null, 2));
    console.log('Dados exportados do MySQL para JSON com sucesso.');
  } catch (error) {
    console.error('Erro ao exportar dados do MySQL para JSON:', error);
  }
};

// Função para gerar arquivo SQL a partir dos dados do MySQL
exports.generateSQL = async function () {
  try {
    const count = await Laptop.count();
    if (count === 0) {
      throw new Error('Nenhum dado encontrado no banco de dados.');
    }

    // Utilização do mysqldump para criar um arquivo SQL
    await mysqldump({
      connection: {
        host: 'localhost',
        user: 'root',
        password: process.env.MYSQL_PASSWORD,
        database: 'web-scraper-db',
      },
      dumpToFile: './lenovo_laptops.sql',
    });
    console.log('Arquivo SQL gerado com sucesso.');
  } catch (error) {
    console.error('Erro ao gerar arquivo SQL:', error);
  }
};

// Função para gerar um arquivo JSON diretamente pela raspagem de dados
exports.generateJSON = async function () {
  (async () => {
    // Configurando o Puppeteer para iniciar em modo headless
    const browser = await puppeteer.launch({ headless: true });
    const page = await browser.newPage();
    console.log('Acessando a página principal...');
    await page.goto(url, { waitUntil: 'networkidle0' });

    // Lidando com cookies, se necessário
    const cookieSelector = '#cookieBanner > div.acceptContainer > a';
    if (await page.$(cookieSelector) !== null) {
      console.log('Aceitando cookies...');
      await page.click(cookieSelector);
      await new Promise((r) => { setTimeout(r, 5000); });
    }

    // Raspando links dos laptops Lenovo
    console.log('Procurando por laptops Lenovo...');
    const laptopLinks = await page.$$eval('div.caption > h4 > a.title', (anchors) => anchors.filter((anchor) => anchor.textContent.includes('Lenovo')).map((anchor) => anchor.href));
    console.log(`Foram encontrados ${laptopLinks.length} laptops Lenovo.`);

    const laptopsData = [];

    // Iterando sobre cada link de laptop Lenovo
    for (const link of laptopLinks) {
      console.log(`Acessando a página de detalhes: ${link}`);
      await page.goto(link, { waitUntil: 'networkidle0' });

      // Raspando informações detalhadas de cada laptop
      const title = await page.$eval('div.caption > h4.card-title', (el) => el.textContent.trim());
      const description = await page.$eval('p.description', (el) => el.textContent.trim());
      const basePrice = await page.$eval('h4.price', (el) => el.textContent.trim());
      console.log(`Coletando dados do laptop: ${title}`);

      const hddOptions = [];

      // Raspando opções de HDD disponíveis para cada laptop
      const hddButtons = await page.$$('div.swatches > button.btn.swatch:not(.disabled)');
      console.log(`Encontradas ${hddButtons.length} opções de HDD.`);
      for (const button of hddButtons) {
        const size = await page.evaluate((el) => el.textContent.trim(), button);
        console.log(`Clicando na opção de HDD: ${size}`);
        await button.click();
        await new Promise((r) => { setTimeout(r, 1000); });

        // Raspando o preço após clicar em cada opção de HDD
        const priceAfterClick = await page.$eval('h4.price', (el) => el.textContent.trim());
        console.log(`Preço para HDD ${size}: ${priceAfterClick}`);
        hddOptions.push({ size, price: priceAfterClick });
      }

      // Adicionando dados raspados à lista de laptops
      laptopsData.push({
        title, description, basePrice, hddOptions,
      });
    }

    // Fechando o navegador e salvando os dados em um arquivo JSON
    await browser.close();
    fs.writeFileSync('lenovo-laptops.json', JSON.stringify(laptopsData, null, 2));
    console.log('Dados dos laptops Lenovo foram salvos.');
  })();
};
