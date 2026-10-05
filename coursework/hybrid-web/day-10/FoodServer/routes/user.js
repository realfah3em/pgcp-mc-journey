// third party dependencies
const express = require('express')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

// user defined dependencies
const pool = require('../db/pool')
const result = require('../utils/result')
const config = require('../utils/config')

const router = express.Router()

router.post('/signup', async (req, res) => {
    // to avoid sql injection
    // prepared statement
    const { name, email, password, mobile } = req.body
    const sql = 'INSERT INTO user(name,email,password,mobile) VALUES(?,?,?,?)'
    try {
        const hashedPassword = await bcrypt.hash(password, config.SALTROUND)
        const data = await pool.query(sql, [name, email, hashedPassword, mobile])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.post('/signin', async (req, res) => {
    const { email, password } = req.body
    const sql = 'SELECT * FROM user WHERE email = ?'
    try {
        const data = await pool.query(sql, [email])
        const user = data[0][0]
        if (user) {
            const isPasswordCorrect = await bcrypt.compare(password, user.password)
            if (isPasswordCorrect) {
                const payload = {
                    uid: user.uid
                }
                const token = jwt.sign(payload, config.SECRET)
                delete user.password
                delete user.uid
                user.token = token
                res.send(result.createSuccessResult(user))
            } else
                res.send(result.createErrorResult('Invalid Password'))
        } else
            res.send(result.createErrorResult('Invalid Email'))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.get('/', async (req, res) => {
    const sql = 'SELECT name,email,mobile FROM user WHERE uid = ?'
    try {
        const data = await pool.query(sql, [req.headers.uid])
        res.send(result.createSuccessResult(data[0][0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.delete('/', async (req, res) => {
    const sql = 'DELETE FROM user WHERE uid = ?'
    try {
        const data = await pool.query(sql, [req.headers.uid])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.put('/', async (req, res) => {
    const sql = 'UPDATE user SET mobile = ? WHERE uid = ?'
    try {
        const data = await pool.query(sql, [req.body.mobile, req.headers.uid])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})


module.exports = router