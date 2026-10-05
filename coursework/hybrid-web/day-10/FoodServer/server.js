// third party dependencies
const express = require('express')
const cors = require('cors')

// user defined dependencies
const authorizeUser = require('./utils/authUser')

// import all routes
const foodRouter = require('./routes/food')
const orderRouter = require('./routes/orders')
const userRouter = require('./routes/user')

const app = express()

// middlewares
app.use(cors())
app.use('/foodimage', express.static('foodimages')) // static routing
app.use(express.json())
app.use(authorizeUser)
app.use('/food', foodRouter)
app.use('/order', orderRouter)
app.use('/user', userRouter)

app.listen('4000', '0.0.0.0', () => {
    console.log('server started on port 4000')
})