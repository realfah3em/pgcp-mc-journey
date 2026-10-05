let num = 100
num = 200
num = 300

let function1 = function () {
  console.log(`inside function1 1`)
}

function1 = function (p1) {
  console.log(`inside function1 2`)
}

function1 = function (p1, p2) {
  console.log(`inside function1 3`)
}

function1()
