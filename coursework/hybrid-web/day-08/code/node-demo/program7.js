const http = require('node:http')

// create the server
const server = http.createServer((request, response) => {
  // process the request
  console.log(`received a request: ${request.method} - ${request.url}`)

  // send the response
  response.end('response from server')
})

// start the server
server.listen(8100, '0.0.0.0', () => {
  console.log(`server started successfully on port 8100`)
})
