const { error } = require('console')
const fs = require('fs/promises')

// function readFromFile() {
//     const promise = fs.readFile('file1.txt')
//     promise.then(data => {
//         console.log('data - ' + data)
//         const promise2 = fs.appendFile('world')

//     })
//     promise.catch(error => console.log(error))
// }

function readFromFile() {
    fs.readFile('file1.txt')
        .then(data1 => {
            console.log('data - ' + data1)
            fs.appendFile('file1.txt', 'world')
                .then(() => {
                    console.log('file apppended')
                    fs.readFile('file1.txt')
                        .then(data2 => console.log('changed data - ' + data2))
                        .catch(error => console.log(error))
                })
                .catch(error => console.log(error))
        })
        .catch(error => console.log(error))
}



readFromFile()