const express = require('express')

// get the router
const router = express.Router()

router.get('/', (request, response) => {
  response.send('list of orders')
})

router.post('/', (request, response) => {
  response.send('successfully created a new order')
})

// export the router
module.exports = router
