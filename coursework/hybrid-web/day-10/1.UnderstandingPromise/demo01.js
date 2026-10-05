const fs = require('fs')

function readFromFile() {
    fs.readFile('file.txt', (error, data) => {
        if (data) {
            console.log('data - ' + data)
        }
        else
            console.log(error)
    })
}



readFromFile()