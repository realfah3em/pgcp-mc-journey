function add() {
    console.log("addition")
}

function sub() {
    console.log("substraction")
}

function mul() {
    console.log("multiplication")
}

// default export
module.exports = add
module.exports.subtract = sub
module.exports.mul = mul
