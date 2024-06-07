// db.js
const mysql = require('mysql2');
require('dotenv').config();

const db = mysql.createConnection({
  host: process.env.MYSQL_HOST || 'mysql',
  user: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASSWORD || '0000',
  database: process.env.MYSQL_DATABASE || 'formation_management',
  // Configuration spécifique pour l'authentification MySQL
  authPlugin: 'mysql_native_password' // Utilisez 'mysql_native_password' comme mode d'authentification
});

db.connect(err => {
  if (err) {
    console.error('Erreur de connexion à la base de données : ', err);
    return;
  }
  console.log('Connecté à la base de données MySQL');
});

module.exports = db;
