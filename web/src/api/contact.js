import request from "../utils/request.js"

export const getContactLists = (params) => {
    return request({
        url: 'addr/get_contact',
        method: 'post',
        data: params
    })
}
export const addContact = (data) => {
    return request({
        url: 'addr/add_contact',
        method: 'post',
        data: data

    })
}

export const editContact = (data) => {
    return request({
        url: `addr/update_contact`,
        method: 'post',
        data: data
    })
}
export const delContact = (id) => {
    return request({
        url: 'addr/delete_contact',
        method: 'post',
        data: id
    })
}