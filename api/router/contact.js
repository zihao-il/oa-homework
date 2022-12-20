const express = require("express");
const router = express.Router()
const expressjoi = require('@escook/express-joi')

const addrBookHandler = require('../router_handler/contact')
const {add_contact_schema, update_contact_schema, delete_contact_schema} = require("../schema/contact");

router.post('/get_contact', addrBookHandler.get_contact)

router.post('/add_contact', expressjoi(add_contact_schema), addrBookHandler.add_contact)

router.post('/update_contact', expressjoi(update_contact_schema), addrBookHandler.update_contact)

router.post('/delete_contact', expressjoi(delete_contact_schema), addrBookHandler.delete_contact)


module.exports = router