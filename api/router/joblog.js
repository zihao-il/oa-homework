const express = require("express");
const router = express.Router()
const expressjoi = require('@escook/express-joi')

const logHandler = require('../router_handler/joblog')
const {add_joblog_schema, update_joblog_schema, delete_joblog_schema} = require("../schema/joblog");

router.post('/get_joblog', logHandler.get_joblog)

router.post('/add_joblog', expressjoi(add_joblog_schema), logHandler.add_joblog)

router.post('/update_joblog', expressjoi(update_joblog_schema), logHandler.update_joblog)

router.post('/delete_joblog', expressjoi(delete_joblog_schema), logHandler.delete_joblog)


module.exports = router