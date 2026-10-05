const jwt = require('jsonwebtoken')

const result = require('./result')
const config = require('./config')

function authorizeUser(req, res, next) {
    const path = req.path
    if (path == '/user/signin' || path == '/user/signup' || path == '/food/menu')
        next()
    else {
        // authorization
        const token = req.headers.token
        if (token) {
            try {
                const payload = jwt.verify(token, config.SECRET)
                req.headers.uid = payload.uid
                next()
            } catch (error) {
                res.send(result.createErrorResult('Token is Invalid'))
            }
        } else
            res.send(result.createErrorResult('Token is Missing'))
    }
}

module.exports = authorizeUser