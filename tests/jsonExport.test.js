/* File: tests/jsonExport.test.js */
const fs = require('fs');
const path = require('path');
const { exportMySQLtoJSON } = require('../src/scraperFunctions');

describe('JSON Export Tests', () => {
  const jsonFilePath = path.join(__dirname, '..', 'lenovo-laptops.json');

  test('Deve gerar um arquivo JSON com os dados exportados', async () => {
    await exportMySQLtoJSON();
    
    expect(fs.existsSync(jsonFilePath)).toBe(true);

    const fileContent = fs.readFileSync(jsonFilePath, 'utf8');
    const jsonData = JSON.parse(fileContent);

    expect(Array.isArray(jsonData)).toBe(true);
    expect(jsonData.length).toBeGreaterThan(0);
    // Adicione mais verificações conforme necessário
  });
});