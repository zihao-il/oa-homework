const joi = require('joi')


const schema = {
    id: joi.number().integer().min(1).required(),
    name: joi.string().required(),

}

exports.reg_login_schema = {
    body: schema
}

exports.add_user_schema = {
    body: {
        id: joi.number().integer().min(1).empty(''),
        name: joi.string().required(),
        nick_name: joi.string().empty(''),
        password: joi.string().pattern(/^[\S]{6,12}$/).required(),
        role: joi.string().valid('管理员', '普通用户').empty('').default('普通用户'),
    }
}


exports.update_user_schema = {
    body: {
        id: joi.number().integer().min(1).required(),
        name: joi.string().required(),
        nick_name: joi.string().empty(''),
        role: joi.string().valid('管理员', '普通用户').empty('').default('普通用户'),
    }
}

exports.delete_user_schema = {
    body: {
        id: joi.number().integer().min(1).required(),
    }
}

