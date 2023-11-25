/* File: src/database/models/Laptop.js */
const Sequelize = require('sequelize');
const sequelize = require('../config/database');
const HddOption = require('./HddOption');

// Define o modelo Laptop, que representa a tabela laptops no banco de dados.
const Laptop = sequelize.define('laptop', {
  title: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  description: {
    type: Sequelize.TEXT,
    allowNull: false,
  },
  basePrice: {
    type: Sequelize.DECIMAL(10, 2),
    allowNull: false,
  },
});

// Configuração da relação entre os modelos Laptop e HddOption. Um laptop pode ter várias opções de
// HD, mas uma opção de HD só pode pertencer a um laptop.
Laptop.hasMany(HddOption);
HddOption.belongsTo(Laptop);

module.exports = Laptop;
