const mysql2 = require('mysql2/promise')

const pool = mysql2.createPool({
    host: 'localhost',
    user: 'root',
    password: process.env.DB_PASSWORD,
    database: 'foodorder_db'
})

module.exports = pool