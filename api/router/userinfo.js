const express = require('express')
const expressjoi = require('@escook/express-joi')

const userInfoHandler = require('../router_handler/userinfo')

const router = express.Router()

const {add_user_schema, update_user_schema, delete_user_schema} = require('../schema/userinfo')

router.post('/userinfo', userInfoHandler.getUserInfo)

router.post('/get_user', userInfoHandler.get_user)

router.post('/get_role', userInfoHandler.get_role)

router.post('/add_user', expressjoi(add_user_schema), userInfoHandler.add_user)

router.post('/update_user', expressjoi(update_user_schema), userInfoHandler.update_user)

router.post('/delete_user', expressjoi(delete_user_schema), userInfoHandler.delete_user)


module.exports = router