const express = require('express')

const app = express()

// express.json()
// - returns a function that is responsible for converting
//   the request JSON body into an object

// add a middleware to convert the rquest body into a body object
app.use(express.json())

// data source
const cars = []

app.get('/cars', (request, response) => {
  response.send(cars)
})

app.post('/cars', (request, response) => {
  console.log(`request body = `, request.body)

  // object destructuring
  const { model, company, price, color } = request.body

  // add the data sent by the user into cars collection
  // cars.push({
  //   model: request.body.model,
  //   company: request.body.company,
  //   price: request.body.price,
  //   color: request.body.color,
  // })

  cars.push({
    model,
    company,
    price,
    color,
  })
  response.send('inserted car')
})

app.listen(8100, '0.0.0.0', () => {
  console.log(`server started on port 8100`)
})
