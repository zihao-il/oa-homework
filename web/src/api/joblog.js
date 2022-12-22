import request from "../utils/request.js"

export const getJobLogLists = (params) => {
    return request({
        url: 'log/get_joblog',
        method: 'post',
        data: params
    })
}
export const addJobLog = (data) => {
    return request({
        url: 'log/add_joblog',
        method: 'post',
        data: data

    })
}

export const editJobLog = (data) => {
    return request({
        url: `log/update_joblog`,
        method: 'post',
        data: data
    })
}
export const delJobLog = (id) => {
    return request({
        url: 'log/delete_joblog',
        method: 'post',
        data: id
    })
}