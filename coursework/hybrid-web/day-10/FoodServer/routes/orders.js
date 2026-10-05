// third party dependencies
const express = require('express')

// user defined dependencies
const pool = require('../db/pool')
const result = require('../utils/result')

const router = express.Router()

router.post('/', async (req, res) => {
    const { total_amount, cartItems } = req.body
    const uid = req.headers.uid
    const sql1 = 'INSERT INTO orders(uid, total_amount) VALUES(?,?)'
    const sql2 = 'INSERT INTO orderdetails(oid, fid, quantity) VALUES(?,?,?)'
    try {
        const data = await pool.query(sql1, [uid, total_amount])
        const oid = data[0].insertId
        for (cartItem of cartItems) {
            const { fid, qty } = cartItem
            await pool.query(sql2, [oid, fid, qty])
        }
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.get('/', async (req, res) => {
    const sql = 'SELECT oid,odate,deldate,total_amount,status FROM orders WHERE uid = ?'
    try {
        const data = await pool.query(sql, [req.headers.uid])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

module.exports = router