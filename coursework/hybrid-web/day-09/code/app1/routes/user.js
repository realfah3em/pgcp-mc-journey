const express = require('express')

// get the router from express
const router = express.Router()

router.post('/register', (request, response) => {
  response.send('registered successfully')
})

router.post('/login', (request, response) => {
  response.send('logged in successfully')
})

// export the router from the module
module.exports = router
