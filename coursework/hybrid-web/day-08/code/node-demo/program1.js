function function1() {
  console.log(`inside function1`)

  const myVar = 10
  console.log(`myVar = ${myVar}, type = ${typeof myVar}`)
}

// function1()

function add(p1, p2) {
  console.log(`${p1} + ${p2} = ${p1 + p2}`)
}

function subtract(p1, p2) {
  console.log(`${p1} - ${p2} = ${p1 - p2}`)
}

function divide(p1, p2) {
  console.log(`${p1} / ${p2} = ${p1 / p2}`)
}

function multiply(p1, p2) {
  console.log(`${p1} * ${p2} = ${p1 * p2}`)
}

const PI = 3.14

// add(10, 20)
// subtract(10, 20)
// divide(10, 20)
// multiply(10, 20)
// console.log(`PI = ${PI}`)

// module represents the current module
// console.log(`module: `, module)

// export the required entities
module.exports = {
  add,
  subtract,
  multiply,
  divide,
  PI,
}
