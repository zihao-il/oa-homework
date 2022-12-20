<template>
    <div class="login_container">
        <div class="login_box">
            <h1>OA后台系统登录</h1>
            <div class="form_box">
                <el-form :rules="loginFormRules" ref="loginFormRef" :model="loginForm">
                    <el-form-item prop="username">
                        <el-input v-model="loginForm.username" prefix-icon="User"></el-input>
                    </el-form-item>

                    <el-form-item prop="password">
                        <el-input v-model="loginForm.password" show-password prefix-icon="Lock"
                                  type="password"></el-input>
                    </el-form-item>
                    <el-row justify="end">
                        <el-button @click="loginHandler" type="primary">登录</el-button>
                        <el-button @click="resetHandler" type="info">重置</el-button>
                    </el-row>
                </el-form>
            </div>

        </div>
    </div>
</template>

<script>
import {login} from '@/api/login'

export default {
    data() {
        return {
            loginForm: {
                username: '',  // 默认账户密码 admin 123456
                password: ''
            },
            loginFormRules: {
                username: [
                    {request: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 2, max: 10, request: true, message: '用户名在2-10个字符之间', trigger: 'blur'}
                ],
                password: [
                    {request: true, message: '请输入登录密码', trigger: 'blur'},
                    {min: 6, max: 16, request: true, message: '登录密码在6-16个字符之间', trigger: 'blur'}
                ]
            }
        }
    },
    methods: {
        loginHandler() {
            this.$refs.loginFormRef.validate(async isValid => {
                if (isValid) {
                    const {data} = await login(this.loginForm)
                    if (data.status === 0) {
                        window.localStorage.setItem('username', this.loginForm.username)
                        window.localStorage.setItem('token', data.token)
                        this.$message({
                            message: data.message,
                            type: 'success'
                        })
                        this.$router.push('/welcome')
                    } else {
                        this.$message({
                            message: data.message,
                            type: 'error'
                        })
                    }
                }
            })

        },
        resetHandler() {
            this.$refs.loginFormRef.resetFields()
        },
    }
    ,
}
</script>

<style lang="scss" scoped>
h1 {
    text-align: center;
    padding-top: 10%;
}

.login_container {
    background-color: #2B5B6B;
    height: 100%;
}

.login_box {
    width: 450px;
    height: 300px;
    background: #FFFFFF;
    border-radius: 3px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.avatar_box {
    height: 130px;
    width: 130px;
    border: 1px solid #EEEEEE;
    border-radius: 50%;
    padding: 10px;
    box-shadow: 0 0 10px #DDDDDD;
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #FFFFFF;

    img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        background-color: #EEEEEE;
    }
}

.form_box {
    position: absolute;
    bottom: 20px;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
}
</style>