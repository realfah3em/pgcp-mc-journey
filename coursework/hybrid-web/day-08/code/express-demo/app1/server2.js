const express = require('express')

const app = express()

// data source
const cars = [
  {
    model: 'Mustang',
    price: 30000,
    company: 'Ford',
    color: 'Red',
  },
  {
    model: 'Corvette',
    price: 80000,
    company: 'Chevrolet',
    color: 'Blue',
  },
  {
    model: 'Camry',
    price: 25000,
    company: 'Toyota',
    color: 'Silver',
  },
  {
    model: 'Ferrari',
    price: 150000,
    company: 'Ferrari',
    color: 'Red',
  },
  {
    model: 'Civic',
    price: 20000,
    company: 'Honda',
    color: 'White',
  },
]

const products = [
  {
    title: 'Smartphone',
    price: 599,
    brand: 'Apple',
    id: 1,
    tags: ['Electronics', 'Smartphone'],
  },
  {
    title: 'Laptop',
    price: 999,
    brand: 'Dell',
    id: 2,
    tags: ['Computer', 'Laptop'],
  },
  {
    title: 'Headphones',
    price: 129,
    brand: 'Sony',
    id: 3,
    tags: ['Electronics', 'Headphones'],
  },
  {
    title: 'Watch',
    price: 299,
    brand: 'Fossil',
    id: 4,
    tags: ['Fashion', 'Watch'],
  },
  {
    title: 'Tablet',
    price: 499,
    brand: 'Samsung',
    id: 5,
    tags: ['Electronics', 'Tablet'],
  },
]

const mobiles = [
  {
    title: 'iPhone 14',
    price: 799,
    brand: 'Apple',
    id: 1,
    tags: ['Smartphone', 'Apple', 'Latest Model'],
  },
  {
    title: 'Samsung Galaxy S23',
    price: 899,
    brand: 'Samsung',
    id: 2,
    tags: ['Smartphone', 'Samsung', 'High End'],
  },
  {
    title: 'Google Pixel 6',
    price: 699,
    brand: 'Google',
    id: 3,
    tags: ['Smartphone', 'Google', 'Camera Focus'],
  },
  {
    title: 'OnePlus 10 Pro',
    price: 799,
    brand: 'OnePlus',
    id: 4,
    tags: ['Smartphone', 'OnePlus', 'Fast Charging'],
  },
  {
    title: 'Xiaomi Redmi Note 11',
    price: 399,
    brand: 'Xiaomi',
    id: 5,
    tags: ['Smartphone', 'Xiaomi', 'Budget Friendly'],
  },
]

function log(request, response, next) {
  console.log('inside the log function')
  console.log('received a request')

  // call the next function
  next()
  
}

function middlware1(request, response, next) {
  console.log(`inside middleware 1`)
  next()
}

function middlware2(request, response, next) {
  console.log(`inside middleware 2`)
  next()
}

// middleware
// - a function which will be called before calling any of the handlers
// - can be configured using app.use() function
// - accepts 3 parameters
//   - request: request object client has sent
//   - response: response object server will send to the client
//   - next:
//     - reference to the next logical function (could be the route handler)
//     - if next() is called, the control goes to the next function
//     - if next() is not called, the control stops in the middleware function

// configure the log function as a middleware
// since the order of middleware call depends on the app.use() configuration
// in the following code, the sequece of middlewares: log, middleware1, middleware2
app.use(log)
app.use(middlware1)
app.use(middlware2)

// add the mobiles route
app.get('/mobiles', (request, response) => {
  console.log(`GET /mobiles`)
  response.send(mobiles)
})

// add the products routes
app.get('/products', (request, response) => {
  console.log(`GET /products`)
  response.send(products)
})

// add the car routes
app.get('/cars', (request, response) => {
  console.log(`GET /cars`)
  response.send(cars)
})

// add the default routes
app.get('/', (request, response) => {
  console.log(`GET /`)
  response.send('GET response')
})

app.listen(8100, '0.0.0.0', () => {
  console.log('server started on port 8100')
})
