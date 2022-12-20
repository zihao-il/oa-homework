import request from "../utils/request.js"

export const login = function (data) {
    return request({
        url: 'api/login',
        method: 'post',
        data: data
    })
}
