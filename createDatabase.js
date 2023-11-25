require('dotenv').config();
const mysql = require('mysql2/promise');

async function createDatabase() {
  const connection = await mysql.createConnection({
    host: `${process.env.MYSQL_HOST}` || 'localhost',
    user: `${process.env.MYSQL_USER}` || 'root',
    password: `${process.env.MYSQL_PASSWORD}`,
  });
  await connection.query('CREATE DATABASE IF NOT EXISTS `web-scraper-db`');
  await connection.end();
}

createDatabase();
