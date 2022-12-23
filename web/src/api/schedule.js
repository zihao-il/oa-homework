import request from "../utils/request.js"

export const getScheduleLists = (params) => {
    return request({
        url: 'schedules/get_schedule',
        method: 'post',
        data: params
    })
}

export const addSchedule = (data) => {
    return request({
        url: 'schedules/add_schedule',
        method: 'post',
        data: data

    })
}

export const editSchedule = (data) => {
    return request({
        url: `schedules/update_schedule`,
        method: 'post',
        data: data
    })
}

export const delSchedule = (id) => {
    return request({
        url: 'schedules/delete_schedule',
        method: 'post',
        data: id
    })
}