/* File: src/database/config/database.js */
const Sequelize = require('sequelize');

const sequelize = new Sequelize('web-scraper-db', 'root', '123456', {
  host: 'localhost', // ou o nome do serviço do Docker se estiver rodando dentro de um container
  dialect: 'mysql',
  operatorsAliases: 0,

  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000,
  },
});

module.exports = sequelize;
