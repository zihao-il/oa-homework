<template>
    <div id="bg1" class="bgbox"></div>
    <div id="bg2" class="bgbox"></div>
    <div id="bg3" class="bgbox"></div>
    <div class="login_container">
        <div class="login_box">
            <h1>OA后台系统登录</h1>
            <div class="form_box">
                <el-form :rules="loginForm.loginFormRules" ref="loginFormRef" :model="loginForm.form">
                    <el-form-item prop="username">
                        <el-input v-model="loginForm.form.username" WarningColor='warning'
                                  prefix-icon="User"></el-input>
                    </el-form-item>

                    <el-form-item prop="password">
                        <el-input v-model="loginForm.form.password" show-password prefix-icon="Lock"
                                  type="password"></el-input>
                    </el-form-item>
                    <el-row justify="end">
                        <el-button @click="loginForm.loginHandler" type="primary">登录</el-button>
                        <el-button @click="loginForm.resetHandler" type="info">重置</el-button>
                    </el-row>
                </el-form>
            </div>

        </div>
    </div>
</template>

<script>
import {login} from '@/api/login'
import {reactive, ref} from "vue";
import {ElMessage} from "element-plus";
import router from "@/router";

export default {
    setup() {
        const loginFormRef = ref()
        const loginForm = reactive({

            form: {
                username: '',  // 默认账户密码 admin 123456
                password: ''
            },
            loginFormRules: {
                username: [
                    {request: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 2, max: 10, message: '用户名在2-10个字符之间', trigger: 'blur'}
                ],
                password: [
                    {request: true, message: '请输入登录密码', trigger: 'blur'},
                    {min: 6, max: 16, message: '登录密码在6-16个字符之间', trigger: 'blur'}
                ]
            },
            loginHandler: () => {
                loginFormRef.value.validate(async (isValid) => {
                    if (!isValid) {
                        return ElMessage({message: "用户信息填写错误！", type: "error"});
                    }

                    const {data} = await login(loginForm.form)
                    if (data.status === 0) {
                        window.localStorage.setItem('username', loginForm.form.username)
                        window.localStorage.setItem('token', data.token)
                        ElMessage({message: data.message, type: "success"});
                        await router.push('/welcome')
                    } else {
                        ElMessage({message: data.message, type: "error"});

                    }
                })

            },
            resetHandler: () => {
                ElMessage({message: '已清空输入框！', type: "success"});
                loginFormRef.value.resetFields()
            },


        })
        return {
            loginForm, loginFormRef,
        }

    },


}
</script>

<style lang="scss" scoped>
.bgbox {
    width: 100vw;
    height: 100vh;
    position: fixed;
    top: 0;
}


#bg1 {
    z-index: -1;
    background: url("../img/1.png");
    animation-name: diybg;
    animation-timing-function: ease-in-out;
    animation-iteration-count: infinite;
    animation-duration: 10s;
    animation-direction: alternate;

}

#bg2 {
    z-index: -2;
    background: url("../img/2.png");
    animation-name: diybg2;
    animation-timing-function: ease-in-out;
    animation-iteration-count: infinite;
    animation-duration: 10s;
    animation-direction: alternate;

}

#bg3 {
    z-index: -3;
    background: url("../img/3.png");
}

@keyframes diybg {
    0% {
        opacity: 1;
    }

    25% {
        opacity: 0;
    }

    50% {
        opacity: 0;
    }


    75% {
        opacity: 1;
    }
}

@keyframes diybg2 {

    25% {
        opacity: 1;
    }

    50% {
        opacity: 0;
    }


    75% {
        opacity: 0;
    }

    100% {
        opacity: 1;
    }
}

h1 {
    text-align: center;
    padding-top: 10%;
}

.login_container {
    height: 100%;
}

.login_box {
    width: 450px;
    height: 300px;
    background: rgba(255, 255, 255, .8);
    border-radius: 10px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.form_box {
    position: absolute;
    bottom: 20px;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;

}
</style>