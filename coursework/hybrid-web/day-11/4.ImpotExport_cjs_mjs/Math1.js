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
// module.exports = add
// module.exports = sub

// module.exports.add = add
// module.exports.substract = sub

module.exports = { add, substract: sub, mul }