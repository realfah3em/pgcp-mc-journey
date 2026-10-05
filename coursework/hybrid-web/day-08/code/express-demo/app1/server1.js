// import express
const epxress = require('express')

// create express application
const app = epxress()

// route
// - mapping between
//   - http method: GET/POST/PUT/DELETE/PATCH
//   - request url path
//   - event handler: function
// - the handler function gets called when a request is received with
//   configured method and the url

// this route will configure the server to call the handler when
// a request is received with method GET and url '/'
app.get('/', (request, response) => {
  console.log(`received a request: GET /`)
  response.send('this is a GET response from server')
})

app.post('/', (request, response) => {
  console.log(`received a request: POST /`)
  response.send('this is a POST response from server')
})

app.put('/', (request, response) => {
  console.log(`received a request: PUT /`)
  response.send('this is a PUT response from server')
})

app.delete('/', (request, response) => {
  console.log(`received a request: DELETE /`)
  response.send('this is a DELETE response from server')
})
// start the express application
app.listen(8100, '0.0.0.0', () => {
  console.log('server started on port 8100')
})
