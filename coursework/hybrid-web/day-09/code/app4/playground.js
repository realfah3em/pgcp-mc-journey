const cryptoJs = require('crypto-js')

const password = process.env.DEMO_PASSWORD || 'example-password'
console.log(String(cryptoJs.SHA256(password)))
