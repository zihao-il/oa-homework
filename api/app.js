const express = require('express')
const app = express()
const cors = require('cors')

app.use(express.urlencoded({extended: false}))

const {expressjwt} = require('express-jwt')
const config = require('./config')


// 1. 全局加载跨域请求处理中件间
app.use(cors())
// 2. 全局加载表单编码处理中件间
app.use(express.urlencoded({extended: false}))

app.use(express.json());

app.use((req, res, next) => {
    res.fail = (err) => {
        res.send({
            status: 1,
            message: err instanceof Error ? err.message : err
        })
    }
    next()
})

app.use(expressjwt({
    algorithms: ["HS256"],
    secret: config.jwtSecretKey
}).unless({
    path: ["/api/private/v1/login"]
}))

const userRouter = require('./router/user')
app.use('/api/private/v1/', userRouter)

const userInfoRouter = require('./router/userinfo')
app.use('/api/private/v1/my', userInfoRouter)

const addrInfoRouter = require('./router/contact')
app.use('/api/private/v1/addr', addrInfoRouter)

const logInfoRouter = require('./router/joblog')
app.use('/api/private/v1/log', logInfoRouter)

const scheduleInfoRouter = require('./router/schedule')
app.use('/api/private/v1/schedules', scheduleInfoRouter)




app.listen(9090, () => {
    console.log('办公自动化系统，监听9090');
})
