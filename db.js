const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Abrdi6#2007', 
    database: 'healthtrack_db'
});

db.connect((err) => {
    if (err) return console.error('Erro ao conectar no banco de dados:', err);
    console.log('Conectado ao MySQL com sucesso!');
});

module.exports = db;