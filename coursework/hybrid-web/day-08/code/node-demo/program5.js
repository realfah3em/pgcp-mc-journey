// import fs module to perform all fs related functionality
const fs = require('node:fs')

// types
// - blocking function
//   - also known as synchronous function
//   - it blocks the next line (function) from calling till the previous
//     statement is being executed
//   - it always produce a predictible answer
//   - it always executes the code in sequential manner
//   - if an exception is thrown, handling the error is mandatory to avoid application crash
// - non-blocking function
//   - also known as asynchronous function
//   - it does not block the next statement from calling,
//     even if the current line is still being executed
//   - the flow of the code can NOT be predicted
//   - every function in nodejs which does NOT use 'sync' suffix is
//     considered as non-blocking function
//   - every non-blocking function accepts the last parameter as a callback function
//   - every non-blocking function does not return anything
//   - callback function accepts
//     - first parameter: error (valid if there is any error performing function)
//     - second onwards: result of the function (valid if there is NO error)
//   - behind the scene, it uses a thread to execute these functions parallely

function function1() {
  // read the contents of a file synchronously
  console.log('reading file started')
  const contents = fs.readFileSync('./myfile.txt')
  console.log('reading file finished')
  //   console.log(`contents = ${contents}`)

  // perform a mathematical operation
  console.log(`math operation started`)
  const result = 234289423434243234234 * 2423434223442 * 24322342343423 * 223432423424
  console.log(`math operation finished`)
  console.log(`result = ${result}`)
}

// function1()

function function2() {
  console.log(`file reading started`)
  // read the contents of the file asynchronously
  fs.readFile('./myfile.txt', (error, result) => {
    // this callback function gets called when reading file is finished
    console.log(`file reading finished`)
    console.log(`contents:  ${result}`)
  })

  // perform a mathematical operation
  console.log(`math operation started`)
  const result = 234289423434243234234 * 2423434223442 * 24322342343423 * 223432423424
  console.log(`math operation finished`)
  console.log(`result = ${result}`)
}

// function2()

function function3() {
  try {
    const contents = fs.readFileSync('./myfile5.txt')
    console.log(`contents = ${contents}`)
  } catch (ex) {
    console.log(`exception handled: `, ex)
  }
}

// function3()

function function4() {
  fs.readFile('./myfile5.txt', (error, result) => {
    if (error) {
      console.log(`error: `, error)
    } else {
      console.log(`contents:  ${result}`)
    }
  })
}

function4()
