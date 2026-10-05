// built-in module
const fs = require('fs/promises')

// third party dependencies
const express = require('express')
const multer = require('multer')

// user defined dependencies
const pool = require('../db/pool')
const result = require('../utils/result')

const router = express.Router()
const upload = multer({ dest: 'foodimages' })

router.post('/add', upload.single('image'), async (req, res) => {
    const sql = 'INSERT INTO food(name,description,price,image) VALUES(?,?,?,?)'
    const { name, description, price } = req.body
    const { originalname, path, destination } = req.file
    try {
        await fs.rename(path, destination + '/' + originalname)
        const data = await pool.query(sql, [name, description, price, originalname])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.get('/menu', async (req, res) => {
    const sql = 'SELECT * FROM food'
    try {
        const data = await pool.query(sql)
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }

})

module.exports = router