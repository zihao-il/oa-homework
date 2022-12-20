<template>
    <div class="common-layout">
        <el-container class="home">
            <el-header>

                <el-row :gutter="20">
                    <el-col :span="20">
                        <h2>OA系统管理后台</h2></el-col>
                    <el-col :span="4">
                        <el-dropdown>
                        <span class="el-dropdown-link">
                         {{ getUserInfo.names.roleName }}：{{ getUserInfo.names.username }}<el-icon
                            class="el-icon--right"><arrow-down/></el-icon>
                        </span>
                            <template #dropdown>
                                <el-dropdown-menu>
                                    <el-dropdown-item @click="logoutHandler">退出系统
                                    </el-dropdown-item>
                                </el-dropdown-menu>
                            </template>
                        </el-dropdown>

                    </el-col>
                </el-row>
            </el-header>
            <el-container>
                <el-aside :class="asideWidth">
                    <div class="toggle-button" @click="menuToggleHandler">|||</div>
                    <el-menu text-color="#5c5c5c" background-color="#fff" unique-opened :collapse="isCollapse"
                             :default-active="activePath" :collapse-transition="false" router
                             active-text-color="#409EFF">
                        <el-menu-item v-for="menu of menus" :index="'/' + menu.path" :key="menu.id"
                                      @click="saveNavState('/' + menu.path)">
                            <template #title>
                                <el-icon v-html="menu.icon">
                                </el-icon>
                                <span>{{ menu.name }}</span>
                            </template>
                        </el-menu-item>
                    </el-menu>
                </el-aside>
                <el-container>
                    <el-main>
                        <RouterView/>
                    </el-main>
                    <el-footer>

                    </el-footer>
                </el-container>
            </el-container>
        </el-container>
    </div>
</template>

<script>
import {computed, reactive, ref} from 'vue'
import {getUser} from "@/api/user";
import router from "@/router";
import {ElMessage} from "element-plus";

export default {
    setup() {

        const isCollapse = ref(false)
        const asideWidth = computed(() => {
            return isCollapse.value == true ? "narrow" : "enlarge";
        });
        const activePath = ref(window.sessionStorage.getItem("activePath"))

        function menuToggleHandler() {
            isCollapse.value = !isCollapse.value;
        }

        const menus = ref([
            {
                id: 1,
                path: 'user',
                name: '用户管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="M512 512a192 192 0 1 0 0-384 192 192 0 0 0 0 384zm0 64a256 256 0 1 1 0-512 256 256 0 0 1 0 512zm320 320v-96a96 96 0 0 0-96-96H288a96 96 0 0 0-96 96v96a32 32 0 1 1-64 0v-96a160 160 0 0 1 160-160h448a160 160 0 0 1 160 160v96a32 32 0 1 1-64 0z"></path></svg>'
            },
            {
                id: 2,
                path: 'contact',
                name: '联系人管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="m174.72 855.68 135.296-45.12 23.68 11.84C388.096 849.536 448.576 864 512 864c211.84 0 384-166.784 384-352S723.84 160 512 160 128 326.784 128 512c0 69.12 24.96 139.264 70.848 199.232l22.08 28.8-46.272 115.584zm-45.248 82.56A32 32 0 0 1 89.6 896l58.368-145.92C94.72 680.32 64 596.864 64 512 64 299.904 256 96 512 96s448 203.904 448 416-192 416-448 416a461.056 461.056 0 0 1-206.912-48.384l-175.616 58.56z"></path><path fill="currentColor" d="M512 563.2a51.2 51.2 0 1 1 0-102.4 51.2 51.2 0 0 1 0 102.4zm192 0a51.2 51.2 0 1 1 0-102.4 51.2 51.2 0 0 1 0 102.4zm-384 0a51.2 51.2 0 1 1 0-102.4 51.2 51.2 0 0 1 0 102.4z"></path></svg>'
            },
            {
                id: 3,
                path: 'joblog',
                name: '日志信息管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="M192 128v768h640V128H192zm-32-64h704a32 32 0 0 1 32 32v832a32 32 0 0 1-32 32H160a32 32 0 0 1-32-32V96a32 32 0 0 1 32-32z"></path><path fill="currentColor" d="M672 128h64v768h-64zM96 192h128q32 0 32 32t-32 32H96q-32 0-32-32t32-32zm0 192h128q32 0 32 32t-32 32H96q-32 0-32-32t32-32zm0 192h128q32 0 32 32t-32 32H96q-32 0-32-32t32-32zm0 192h128q32 0 32 32t-32 32H96q-32 0-32-32t32-32z"></path></svg>'
            },
            {
                id: 4,
                path: 'schedule',
                name: '日程信息管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="M128 384v512h768V192H768v32a32 32 0 1 1-64 0v-32H320v32a32 32 0 0 1-64 0v-32H128v128h768v64H128zm192-256h384V96a32 32 0 1 1 64 0v32h160a32 32 0 0 1 32 32v768a32 32 0 0 1-32 32H96a32 32 0 0 1-32-32V160a32 32 0 0 1 32-32h160V96a32 32 0 0 1 64 0v32zm-32 384h64a32 32 0 0 1 0 64h-64a32 32 0 0 1 0-64zm0 192h64a32 32 0 1 1 0 64h-64a32 32 0 1 1 0-64zm192-192h64a32 32 0 0 1 0 64h-64a32 32 0 0 1 0-64zm0 192h64a32 32 0 1 1 0 64h-64a32 32 0 1 1 0-64zm192-192h64a32 32 0 1 1 0 64h-64a32 32 0 1 1 0-64zm0 192h64a32 32 0 1 1 0 64h-64a32 32 0 1 1 0-64z"></path></svg>'
            },
            {
                id: 5,
                path: 'message',
                name: '站内消息管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="M128 224v512a64 64 0 0 0 64 64h640a64 64 0 0 0 64-64V224H128zm0-64h768a64 64 0 0 1 64 64v512a128 128 0 0 1-128 128H192A128 128 0 0 1 64 736V224a64 64 0 0 1 64-64z"></path><path fill="currentColor" d="M904 224 656.512 506.88a192 192 0 0 1-289.024 0L120 224h784zm-698.944 0 210.56 240.704a128 128 0 0 0 192.704 0L818.944 224H205.056z"></path></svg>'
            },
            {
                id: 6,
                path: 'notice',
                name: '公告信息管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="M160 826.88 273.536 736H800a64 64 0 0 0 64-64V256a64 64 0 0 0-64-64H224a64 64 0 0 0-64 64v570.88zM296 800 147.968 918.4A32 32 0 0 1 96 893.44V256a128 128 0 0 1 128-128h576a128 128 0 0 1 128 128v416a128 128 0 0 1-128 128H296z"></path><path fill="currentColor" d="M352 512h320q32 0 32 32t-32 32H352q-32 0-32-32t32-32zm0-192h320q32 0 32 32t-32 32H352q-32 0-32-32t32-32z"></path></svg>'
            },
            {
                id: 7,
                path: 'meeting',
                name: '会议信息管理',
                icon: '<svg viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg" data-v-029747aa=""><path fill="currentColor" d="M864 409.6a192 192 0 0 1-37.888 349.44A256.064 256.064 0 0 1 576 960h-96a32 32 0 1 1 0-64h96a192.064 192.064 0 0 0 181.12-128H736a32 32 0 0 1-32-32V416a32 32 0 0 1 32-32h32c10.368 0 20.544.832 30.528 2.432a288 288 0 0 0-573.056 0A193.235 193.235 0 0 1 256 384h32a32 32 0 0 1 32 32v320a32 32 0 0 1-32 32h-32a192 192 0 0 1-96-358.4 352 352 0 0 1 704 0zM256 448a128 128 0 1 0 0 256V448zm640 128a128 128 0 0 0-128-128v256a128 128 0 0 0 128-128z"></path></svg>'
            },
        ])

        function saveNavState(path) {
            window.sessionStorage.setItem("activePath", path);
            activePath.value = path;
        }

        const getUserInfo = reactive({
            names: {
                roleName: '',
                username: '',
            },
            getUser: async () => {
                let username = window.localStorage.getItem('username')
                const {data: data} = await getUser(username)
                if (data.status === 0) {
                    getUserInfo.names.roleName = data.data.role
                    if (data.data.nick_name === null) {  // 优先显示昵称
                        this.username = data.data.name
                    } else {
                        getUserInfo.names.username = data.data.nick_name
                    }
                }
            }


        })
        getUserInfo.getUser()

        function logoutHandler() {
            window.sessionStorage.removeItem('activePath')
            window.localStorage.removeItem('username')
            window.localStorage.removeItem('token')
            ElMessage({message: "已退出登录！", type: "success"});
            router.push('/login')
        }

        return {
            menus, asideWidth,
            isCollapse, menuToggleHandler,
            saveNavState, activePath,
            logoutHandler, getUserInfo
        }
    }
}
</script>

<style lang="scss" scoped>
.el-header {
    background-color: #409EFF;

    .el-dropdown-link {
        color: #FFFFFF;
        font-size: 15px;
        line-height: 60px;
    }

    .example-showcase .el-dropdown + .el-dropdown {
        margin-left: 15px;
    }

    .example-showcase .el-dropdown-link {
        cursor: pointer;
        display: flex;
        align-items: center;
    }

    .el-col {
        line-height: 60px;
        color: #FFFFFF;
    }
}

.el-aside {
    background-color: #FFFFFF;
}

.narrow {
    animation-name: size1;
    animation-duration: .5s;
    animation-fill-mode: forwards;

    @keyframes size1 {
        0% {
            width: 200px;
        }

        100% {
            width: 65px
        }
    }
}

.enlarge {
    animation-name: size2;
    animation-duration: .5s;
    animation-fill-mode: forwards;
    animation-timing-function: ease-in-out;

    @keyframes size2 {
        0% {
            width: 65px;
        }

        100% {
            width: 200px
        }
    }
}

.el-main {
    background-color: #EDF0F5;
    color: #303E67;
}

.home {
    height: 100vh;
}

.toggle-button {
    background-color: #FFFFFF;
    text-align: center;
}

.toggle-button {
    background-color: #8E93A0;
    color: #FFFFFF;
    font-size: 10px;
    height: 24px;
    line-height: 24px;
    text-align: center;
    letter-spacing: 0.2em;
    cursor: pointer;
}

.el-menu {
    border: none;
}
</style>