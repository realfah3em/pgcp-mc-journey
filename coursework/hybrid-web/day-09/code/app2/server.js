// import required packages
const express = require('express')
const cors = require('cors')
const morgan = require('morgan')

// create an app
const app = express()

// add required middleware
app.use(express.json())
app.use(cors())
app.use(morgan('combined'))

// app.use((request, response, next) => {
//   console.log('calling the common route')
//   next()
// })

// add the routes
const userRouter = require('./routes/user')
const productRouter = require('./routes/product')
const orderRotuer = require('./routes/orders')
const cartRouter = require('./routes/cart')

app.use('/user', userRouter)
app.use('/product', productRouter)
app.use('/order', orderRotuer)
app.use('/cart', cartRouter)

// welcome route
app.get('/', (request, response) => {
  response.send('<h1>welcome to e-Commerce application APIs</h1>')
})

app.listen(8100, '0.0.0.0', () => {
  console.log(`server started on port 8100`)
})
