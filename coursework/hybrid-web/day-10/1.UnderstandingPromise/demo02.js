const fs = require('fs')

function readFromFile() {
    fs.readFile('file1.txt', (error, data) => {
        if (data) {
            console.log('data - ' + data)
            // Append the 'world' in file2.txt
            fs.appendFile('file1.txt', 'world', (error) => {
                if (error) {
                    console.log(error)
                }
                else {
                    // read the changed file
                    fs.readFile('file1.txt', (error, data) => {
                        if (data) {
                            console.log('changed data -  ' + data)
                        }
                        else
                            console.log(error)
                    })
                }
            })

        }
        else
            console.log(error)
    })
}



readFromFile()