const fs = require('fs/promises')

async function readFromFile() {
    try {
        const data = await fs.readFile('file1.txt')
        console.log('data - ' + data)
        await fs.appendFile('file1.txt', 'sunbeam')
        const changedData = await fs.readFile('file1.txt')
        console.log('changed data - ' + changedData)
    } catch (error) {
        console.log(error)
    }
}



readFromFile()