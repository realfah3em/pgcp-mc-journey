const express = require('express')

// get the router
const router = express.Router()

router.get('/', (request, response) => {
  response.send('list of items in cart')
})

router.post('/', (request, response) => {
  response.send('successfully added an item to the cart')
})

// export the router
module.exports = router
