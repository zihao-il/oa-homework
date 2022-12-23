const express = require("express");
const router = express.Router()
const expressjoi = require('@escook/express-joi')

const scheduleHandler = require('../router_handler/schedule')

router.post('/get_schedule', scheduleHandler.get_schedule)

router.post('/add_schedule', scheduleHandler.add_schedule)

router.post('/update_schedule', scheduleHandler.update_schedule)

router.post('/delete_schedule', scheduleHandler.delete_schedule)


module.exports = router
