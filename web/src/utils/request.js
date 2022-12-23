import axios from 'axios'

// 创建axios实例,并配置
const service = axios.create({
    baseUrl: 'http://127.0.0.1:9090/api/private/v1/',
    timeout: 10000,
})

service.interceptors.request.use((config) => {
    const token = window.localStorage.getItem('token')
    if (token) {
        config.headers.Authorization = token
    }
    return config
})
export default service
