/* File: src/database/models/Laptop.js */
const Sequelize = require('sequelize');
const sequelize = require('../config/database');
const HddOption = require('./HddOption');

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
  // Outros campos conforme necessário
});

// Um Laptop pode ter várias HddOptions
Laptop.hasMany(HddOption);
HddOption.belongsTo(Laptop);

module.exports = Laptop;
