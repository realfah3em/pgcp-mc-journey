const mysql = require('mysql2')

// create the connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: process.env.DB_PASSWORD,
  database: 'ecommerce_demo',
  port: 3306,
})

// export the pool
module.exports = {
  pool,
}
