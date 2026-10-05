const express = require('express')
const db = require('../db')
const utils = require('../utils')
const cryptoJs = require('crypto-js')
const jwt = require('jsonwebtoken')
const config = require('../config')

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
        // get user details
        const { id, firstName, lastName } = result[0]

        // create the payload
        // - payload is an object which will be added to the token
        const payload = {
          id,
          firstName,
          lastName,
        }

        // create the token
        // - a string which contains
        //   - header: has the algorithm used to create the token
        //   - payload: object to carry from one to another entity
        //   - signature: used to verify the validity of the token (using secret)
        const token = jwt.sign(payload, config.secret)

        // user exists, send the user details in object format
        response.send(
          utils.sendSuccess({
            firstName,
            lastName,

            // send the token through the response
            token,
          }),
        )
      }
    }
  })
})

router.get('/profile', (request, response) => {
  // get the token from request headers
  const token = request.headers['token']

  // check if user has sent the token
  if (!token) {
    response.send(utils.sendError('missing token'))
  } else {
    // check if the token is valid
    const { id } = jwt.verify(token, config.secret)

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
  }
})

// export the router from the module
module.exports = router
