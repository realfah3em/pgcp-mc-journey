const { error } = require('console')
const fs = require('fs/promises')

function readFromFile() {
    fs.readFile('file1.txt')
        .then(data => {
            console.log('data - ' + data)
            return fs.appendFile('file1.txt', 'cpmc')
        })
        .then(() => {
            console.log('File appended')
            return fs.readFile('file1.txt')
        })
        .then(data => console.log('changed data - ' + data))
        .catch(error => console.log(error))
}



readFromFile()