// import all the exported members of program1
// require()
// - used to import a module
// - returns the exported object which contains the exported members of the module
const program1 = require('./program1')
console.log(`program1 = `, program1)

// invoke the functions
program1.add(30, 40)
program1.subtract(30, 40)
program1.multiply(30, 40)
program1.divide(30, 40)
console.log(`PI = `, program1.PI)

// object destructuring
// const { add, subtract, multiply, divide, PI } = program1
// add(30, 40)
// subtract(30, 40)
// multiply(30, 40)
// divide(30, 40)
// console.log(`PI = `, PI)

// object destructuring
const { add, subtract, multiply, divide, PI } = require('./program1')
add(30, 40)
subtract(30, 40)
multiply(30, 40)
divide(30, 40)
console.log(`PI = `, PI)
