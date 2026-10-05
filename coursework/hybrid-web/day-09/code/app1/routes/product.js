const express = require('express')

// get the router
const router = express.Router()

// product routes
router.get('/', (request, response) => {
  response.send('list of products')
})

router.post('/', (request, response) => {
  response.send('successfully added products')
})

// export the router
module.exports = router
