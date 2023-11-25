// tests/sqlExport.test.js
const fs = require('fs');
const path = require('path');
const { generateSQL } = require('../src/scraperFunctions');

describe('SQL Export Tests', () => {
  const sqlFilePath = path.join(__dirname, '..', 'lenovo_laptops.sql');

  test('Deve gerar um arquivo SQL com os dados exportados', async () => {
    await generateSQL();
    
    expect(fs.existsSync(sqlFilePath)).toBe(true);

    const fileContent = fs.readFileSync(sqlFilePath, 'utf8');

    expect(fileContent.length).toBeGreaterThan(0);
  });
});