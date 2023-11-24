/* File: src/database/models/HddOption.js */
const Sequelize = require('sequelize');
const sequelize = require('../config/database');

const HddOption = sequelize.define('hddOption', {
  size: {
    type: Sequelize.STRING,
    allowNull: false,
  },
  price: {
    type: Sequelize.DECIMAL(10, 2), // Ajuste a precisão conforme necessário
    allowNull: false,
  },
});

module.exports = HddOption;
