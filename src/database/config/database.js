/* File: src/database/config/database.js */
// Importa o módulo dotenv para carregar as variáveis de ambiente do arquivo .env.
// Isso é crucial para manter as configurações sensíveis, como credenciais do banco de dados,
// fora do código-fonte e facilmente configuráveis.
require('dotenv').config();

// Importa o Sequelize, um ORM (Object-Relational Mapping) para Node.js.
// O Sequelize facilita a interação com o banco de dados MySQL.
const Sequelize = require('sequelize');

// Cria uma instância do Sequelize para conectar ao banco de dados MySQL.
// As informações para a conexão são retiradas das variáveis de ambiente,
// o que proporciona maior segurança e flexibilidade na configuração do banco de dados.
const sequelize = new Sequelize(
  process.env.MYSQL_DB, // Nome do banco de dados.
  process.env.MYSQL_USER, // Usuário do banco de dados.
  process.env.MYSQL_PASSWORD, // Senha do banco de dados.
  {
    host: process.env.MYSQL_HOST, // Endereço do host do banco de dados.
    dialect: 'mysql', // Define o tipo de banco de dados.
    operatorsAliases: 0, // Desativa aliases de operadores para evitar advertências de segurança.

    // Configuração do pool de conexões para gerenciar um conjunto de conexões ao banco de dados.
    pool: {
      max: 5, // Número máximo de conexões no pool.
      min: 0, // Número mínimo de conexões no pool.
      acquire: 30000, // Tempo máximo, em milissegundos, que o pool tentará obter uma conexão
      // antes de lançar erro.
      idle: 10000, // Tempo máximo, em milissegundos, que uma conexão pode ficar inativa
      // antes de ser liberada.
    },
  },
);

// Exporta a instância do Sequelize para ser utilizada em outras partes do aplicativo.
module.exports = sequelize;
