// import http module for creating a http server
const http = require('node:http')

// create http server
const server = http.createServer((request, response) => {
  console.log(`incoming request`)

  // read metadata from request object
  console.log(`method = ${request.method}`)
  console.log(`path = ${request.url}`)

  // send the response back to the client
  response.end('welcome to the node http server')
})

// start the server
server.listen(8100, '0.0.0.0', () => {
  console.log(`server started successfully on port 8100`)
})
