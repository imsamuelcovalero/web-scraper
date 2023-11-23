/* eslint-disable no-await-in-loop */
const puppeteer = require('puppeteer');
const fs = require('fs');

const url = 'https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops';

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
  fs.writeFileSync('lenovo-laptops-details.json', JSON.stringify(laptopsData, null, 2));
  console.log('Dados dos laptops Lenovo foram salvos.');
})();
