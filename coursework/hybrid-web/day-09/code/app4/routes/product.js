const express = require('express')
const db = require('../db')
const utils = require('../utils')
const multer = require('multer')

// create an object to upload the images to a server directory
// upload is a middleware to read the request and get the image from body
const upload = multer({ dest: 'images' })

// get the router
const router = express.Router()

// product routes
router.get('/', (request, response) => {
  // prepare the query
  const query = `select id, title, brand, description, price, tags, category, primaryImage from products;`

  // execute the query
  db.pool.query(query, (error, result) => {
    response.send(utils.send(error, result))
  })
})

router.post('/with-image', upload.single('image'), (request, response) => {
  const { title, brand, description, price, tags, category } = request.body

  // get the uploaded image name
  const imageName = request.file.filename

  // prepare the query
  const query = `insert into products(title, brand, description, price, tags, category, primaryImage) values (?, ?, ?, ?, ?, ?, ?)`

  // // execute the query
  db.pool.execute(query, [title, brand, description, price, tags, category, imageName], (error, result) => {
    console.log(error)
    response.send(utils.send(error, result))
  })
})

router.post('/', (request, response) => {
  const { title, brand, description, price, tags, category } = request.body

  // prepare the query
  const query = `insert into products(title, brand, description, price, tags, category) values (?, ?, ?, ?, ?, ?)`

  // execute the query
  db.pool.execute(query, [title, brand, description, price, tags, category], (error, result) => {
    response.send(utils.send(error, result))
  })
})

router.delete('/:id', (request, response) => {
  // get the id from parameters
  const { id } = request.params

  // prepare the query
  const sql = `delete from products where id = ?`

  // execute the query
  db.pool.execute(sql, [id], (error, result) => {
    response.send(utils.send(error, result))
  })
})

// export the router
module.exports = router
