const Sequelize = require('sequelize');
const sequelize = require('../config/database');

// Define o modelo HddOption, que representa a tabela hddOptions no banco de dados.
const HddOption = sequelize.define('hddOption', {
  size: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  price: {
    type: Sequelize.DECIMAL(10, 2),
    allowNull: false,
  },
});

module.exports = HddOption;
