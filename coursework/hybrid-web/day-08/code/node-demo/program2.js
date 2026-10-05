// code redundancy/duplication
// - since updating the code becomes difficult in multiple places,
//   it must be avoided
// - to avoid code duplication, node introduces a concept known as Module

console.log(`module: `, module)
console.log(`require: `, require)
console.log(`exports: `, exports)
console.log(`file name: `, __filename)
console.log(`directory name: `, __dirname)
