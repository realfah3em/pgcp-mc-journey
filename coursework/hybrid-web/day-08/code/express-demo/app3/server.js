const express = require('express')
const db = require('mysql2')

// collection of database connections
const pool = db.createPool({
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: process.env.DB_PASSWORD,
  database: 'cars_db',
})

const app = express()

// adding a middleware for converting the request body
app.use(express.json())

// add the routes
app.get('/cars', (request, response) => {
  // create a db statement
  const statement = `select id, model, company, price, color from cars`

  // execute the statement and get the result
  // query() is used to execute the select queries
  pool.query(statement, (error, result) => {
    // check if there any error while executing the statement
    if (error) {
      console.log(`error while executing query: `, error)
      response.send(error)
    } else {
      response.send(result)
    }
  })
})

app.post('/cars', (request, response) => {
  // destructure the data from request body
  const { model, company, price, color } = request.body

  // create the statement
  const statement = `
    insert into cars 
    (model, company, price, color) 
    values (?, ?, ?, ?)`

  // execute the statement
  pool.execute(statement, [model, company, price, color], (error, result) => {
    if (error) {
      console.log(`error while executing query: `, error)
      response.send(error)
    } else {
      response.send(result)
    }
  })
})

app.put('/cars/:carId', (request, response) => {
  // read the id path parameters
  const { carId } = request.params

  // get the new price
  const { price } = request.body

  // create the statement
  const statement = `update cars set price = ? where id = ?`

  // execute the statement
  pool.execute(statement, [price, carId], (error, result) => {
    if (error) {
      console.log(`error while executing query: `, error)
      response.send(error)
    } else {
      response.send(result)
    }
  })
})

app.delete('/cars/:carId', (request, response) => {
  // read the id path parameters
  const { carId } = request.params

  // create the statement
  const statement = `delete from cars where id = ?`

  // execute the statement
  pool.execute(statement, [carId], (error, result) => {
    if (error) {
      console.log(`error while executing query: `, error)
      response.send(error)
    } else {
      response.send(result)
    }
  })
})

app.listen(8100, '0.0.0.0', () => {
  console.log('server started on port 8100')
})
