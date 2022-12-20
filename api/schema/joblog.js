const joi = require('joi')


exports.add_joblog_schema = {
    body: {
        id: joi.number().integer().min(1).empty(''),
        log_time: joi.date().required(),
        title: joi.string().required(),
        content: joi.string().required(),
    }
}
exports.update_joblog_schema = {
    body: {
        id: joi.number().integer().min(1).required(),
        log_time: joi.date().required(),
        title: joi.string().required(),
        content: joi.string().required(),
    }
}

exports.delete_joblog_schema = {
    body: {
        id: joi.number().integer().min(1).required(),

    }
}