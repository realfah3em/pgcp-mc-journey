// import required packages
const express = require('express')
const cors = require('cors')
const morgan = require('morgan')
const jwt = require('jsonwebtoken')
const config = require('./config')
const utils = require('./utils')

// create an app
const app = express()

// add required middleware
app.use(express.json())
app.use(cors())
app.use(morgan('combined'))

// middleware to authorize the user
app.use((request, response, next) => {
  // check the url of request
  const exceptionUrls = ['/user/login', '/user/register', '/user/forgot-password']
  if (exceptionUrls.includes(request.url)) {
    // do not check the token
    next()
  } else {
    // get the token from request header
    const token = request.headers['token']

    // check if token is available
    if (!token) {
      response.send(utils.sendError('token is missing'))
    } else {
      try {
        // verify if the token is valid
        const payload = jwt.verify(token, config.secret)

        // add the payload to the request
        // the same request object will be passed further to the next function
        request.payload = payload

        // call the next function
        next()
      } catch (ex) {
        response.send(utils.sendError('token is invalid'))
      }
    }
  }
})

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
