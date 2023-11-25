// Arquivo: tests/scraper.test.js
const puppeteer = require('puppeteer');

describe('Scraper Tests', () => {
  let browser;
  let page;

  beforeAll(async () => {
    browser = await puppeteer.launch({ headless: 'new' });
    page = await browser.newPage();
  });

  afterAll(async () => {
    await browser.close();
  });

  test('Deve acessar a URL correta', async () => {
    await page.goto('https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops');
    const url = page.url();
    expect(url).toBe('https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops');
  });

  test('Deve encontrar títulos de laptops Lenovo', async () => {
    await page.goto('https://webscraper.io/test-sites/e-commerce/allinone/computers/laptops');
    const laptopTitles = await page.$$eval('div.caption > h4 > a.title', (anchors) => anchors.map((anchor) => anchor.textContent));
    const lenovoLaptops = laptopTitles.filter(title => title.includes('Lenovo'));
    expect(lenovoLaptops.length).toBeGreaterThan(0);
  });
});