const joi = require('joi')


const schema = {
    username: joi.string().alphanum().min(1).max(10).required(),
    nick_name: joi.string(),
    password: joi.string().pattern(/^[\S]{6,12}$/).required()
}

exports.reg_login_schema = {
    body: schema
}