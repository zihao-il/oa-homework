const express = require('express')
const router = express.Router()
const expressjoi = require('@escook/express-joi')


const userHandler = require('../router_handler/user')
const {reg_login_schema} = require("../schema/user");

router.post('/reguser', expressjoi(reg_login_schema),userHandler.regUser)


router.post('/login', userHandler.login)

module.exports = router