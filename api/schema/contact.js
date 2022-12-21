const joi = require('joi')


exports.add_contact_schema = {
    body: {
        id: joi.number().integer().min(1).empty(''),
        name: joi.string().required(),
        sex: joi.string().valid('男', '女'),
        mobile: joi.string().pattern(/^[0-9]{11}$/).required(),
        email: joi.string().email().empty(''),
        qq: joi.string().pattern(/^[0-9]{5,10}$/).empty(''),
        weixin: joi.string().empty(''),
        company: joi.string().empty(''),
        address: joi.string().empty(''),
        post_code: joi.string().pattern(/^[1-9]{5}$/).empty(''),

    }
}

exports.update_contact_schema = {
    body: {
        id: joi.number().integer().min(1).required(),
        name: joi.string().required(),
        sex: joi.string().valid('男', '女'),
        mobile: joi.string().pattern(/^[0-9]{11}$/).required(),
        email: joi.string().email().empty(''),
        qq: joi.string().pattern(/^[0-9]{5,10}$/).empty(''),
        weixin: joi.string().empty(''),
        company: joi.string().empty(''),
        address: joi.string().empty(''),
        post_code: joi.string().pattern(/^[0-9]{5}$/).empty(''),

    }
}


exports.delete_contact_schema = {
    body: {
        id: joi.number().integer().min(1).required(),

    }
}