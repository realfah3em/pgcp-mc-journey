const axios = require('axios')

async function function1() {
  // create the body
  const body = {
    email: process.env.DEMO_EMAIL,
    password: process.env.DEMO_PASSWORD,
  }

  // send the post request and get the response
  const response = await axios.post('http://localhost:8100/user/login', body)
  const result = response.data

  // read the token
  console.log(result.data.token)
}

function1()
