// Arquivo: tests/database.test.js
const sequelize = require('../src/database/config/database');
const Laptop = require('../src/database/models/Laptop');
const HddOption = require('../src/database/models/HddOption');

describe('Database Tests', () => {
  afterAll(async () => {
    await sequelize.close();
  });

  test('Deve conectar com o banco de dados', async () => {
    await expect(sequelize.authenticate()).resolves.toBeUndefined();
  });

  test('Deve inserir dados de laptop no banco de dados', async () => {
    const laptopData = {
      title: 'Test Laptop',
      description: 'A test laptop description',
      basePrice: 999.99,
    };

    const laptop = await Laptop.create(laptopData);

    expect(laptop.title).toBe(laptopData.title);
    expect(laptop.description).toBe(laptopData.description);
    expect(laptop.basePrice).toBe(laptopData.basePrice);

    const hddOptionData = {
      size: '256GB',
      price: 50.00,
      laptopId: laptop.id,
    };

    const hddOption = await HddOption.create(hddOptionData);

    expect(hddOption.size).toBe(hddOptionData.size);
    expect(hddOption.price).toBe(hddOptionData.price);
    expect(hddOption.laptopId).toBe(laptop.id);
  });
});