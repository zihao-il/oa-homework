import request from "../utils/request.js"


export const getUser = (username) => {
    return request({
        url: 'my/userinfo',
        method: 'post',
        data: {
            name: username
        }
    })
}
export const getUserTotal = () => {
    return request({
        url: 'my/get_user_total',
        method: 'post',
    })
}

export const getUserLists = (params) => {
    return request({
        url: 'my/get_user',
        method: 'post',
        data: params
    })
}

export const addUser = (data) => {
    return request({
        url: 'my/add_user',
        method: 'post',
        data: data

    })
}

export const editUser = (data) => {
    return request({
        url: `my/update_user`,
        method: 'post',
        data: data
    })
}

export const delUser = (id) => {
    return request({
        url: 'my/delete_user',
        method: 'post',
        data: id
    })
}

