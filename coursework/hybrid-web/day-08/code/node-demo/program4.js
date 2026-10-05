// import module named os
const os = require('node:os')
// console.log(os)

// get CPU architecture
console.log(`CPU architecture = ${os.arch()}`)

// get OS (platform) type
console.log(`OS type = ${os.platform()}`)

// get all CPUs
console.log(`CPUs: `, os.cpus())

// get the total memory
console.log(`Total Memory = ${os.totalmem()} bytes, ${os.totalmem / (1024 * 1024 * 1024)} GB`)

// get the free memory
console.log(`Free Memory = ${os.freemem()} bytes, ${os.freemem / (1024 * 1024 * 1024)} GB`)
