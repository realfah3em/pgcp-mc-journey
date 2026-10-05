const express = require('express')
const db = require('../db')
const utils = require('../utils')
const cryptoJs = require('crypto-js')

// get the router from express
const router = express.Router()

router.post('/register', (request, response) => {
  const { firstName, lastName, email, password } = request.body

  // encrypt the password
  const encryptedPassword = String(cryptoJs.SHA256(password))

  // prepare the statement
  const sql = `insert into users (firstName, lastName, email, password) values (?, ?, ?, ?)`

  // execute the sql
  db.pool.execute(sql, [firstName, lastName, email, encryptedPassword], (error, result) => {
    response.send(utils.send(error, result))
  })
})

router.post('/login', (request, response) => {
  // get the user inputs
  const { email, password } = request.body

  // encrypt the password
  const encryptedPassword = String(cryptoJs.SHA256(password))

  // prepare the statement
  const query = 'select id, firstName, lastName from users where email = ? and password = ?'

  // execute the query
  db.pool.query(query, [email, encryptedPassword], (error, result) => {
    if (error) {
      // error while executing the query
      response.send(utils.sendError(error))
    } else {
      if (result.length == 0) {
        // no user exists
        response.send(utils.sendError('invalid email or password'))
      } else {
        // user exists, send the user details in object format
        response.send(utils.sendSuccess(result[0]))
      }
    }
  })
})

router.get('/profile/:id', (request, response) => {
  // get the id of the user
  const { id } = request.params

  // create a query to get user profile
  const sql = `select id, firstName, lastName, email, address, phoneNumber from users where id = ?`

  // execute the query
  db.pool.query(sql, [id], (error, result) => {
    if (error) {
      // error while executing the query
      response.send(utils.sendError(error))
    } else {
      if (result.length == 0) {
        // no user exists
        response.send(utils.sendError('user does not exist'))
      } else {
        // user exists, send the user details in object format
        response.send(utils.sendSuccess(result[0]))
      }
    }
  })
})

// export the router from the module
module.exports = router
