const express = require('express')

const app = express()

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

const carsMiddlware = (request, response, next) => {
  console.log('inside cars middleware')
  next()
}

app.get('/cars', carsMiddlware, (request, response) => {
  console.log(`GET /cars`)
  response.send(cars)
})

app.get(
  '/products',
  (request, response, next) => {
    console.log('inside products middleware')
    next()
  },
  (request, response) => {
    console.log(`GET /products`)
    response.send(products)
  },
)

app.listen(8100, '0.0.0.0', () => {
  console.log('server started on port 8100')
})
