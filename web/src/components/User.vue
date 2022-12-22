<template>
    <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/user' }">用户列表管理</el-breadcrumb-item>

    </el-breadcrumb>

    <el-card>
        <el-row :gutter="20">
            <el-col :span="7">
                <el-input placeholder="请输入查询的姓名" @clear="getUserList" @keyup.enter="getUserList" clearable
                          v-model='queryInfo.query'>
                    <template #append>
                        <el-button icon="Search" @click="getUserList"></el-button>
                    </template>
                </el-input>
            </el-col>
            <el-col :span="4">
                <el-button type="primary" icon="Plus" @click="addDialog.visible = true">添加用户</el-button>
            </el-col>
        </el-row>
        <el-table :data="users" border stripe>
            <el-table-column type="index"></el-table-column>
            <el-table-column label="ID" prop="id"></el-table-column>
            <el-table-column label="姓名" prop="name"></el-table-column>
            <el-table-column label="昵称" prop="nick_name"></el-table-column>
            <el-table-column label="用户类型" prop="role">
                <template #default="scope">
                    <el-tag v-if="scope.row.role === '管理员'" effect="dark" round type="success">管理员</el-tag>
                    <el-tag v-else effect="dark" round type="info">普通用户</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="操作" width="300px">
                <template #default="scope">
                    <el-button type="primary" icon="Edit" @click="editDialog.show(scope.row)">编辑</el-button>
                    <el-button type="warning" icon="Warning" @click="passwordDialog.show(scope.row)">改密</el-button>
                    <el-button type="danger" icon="Delete" @click="delUsers(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                       :current-page="queryInfo.pagenum" :page-sizes="[5, 10, 15, 20]" :page-size="queryInfo.pagesize"
                       layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>
    </el-card>


    <el-dialog title="添加用户信息" v-model="addDialog.visible" @close="addDialog.dialogClosed">
        <el-form ref="addFormRef" :rules="addDialog.formRules" :model="addDialog.form" label-width="80px">
            <el-form-item label="姓名" prop="name">
                <el-input v-model="addDialog.form.name" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="昵称" prop="nick_name">
                <el-input v-model="addDialog.form.nick_name" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="用户密码" prop="password">
                <el-input v-model="addDialog.form.password" type="password" show-password/>
            </el-form-item>
            <el-form-item label="确认密码" prop="againPassword">
                <el-input v-model="addDialog.form.againPassword" type="password" show-password/>
            </el-form-item>
            <el-form-item label="用户等级" prop="role">
                <el-radio-group v-model="addDialog.form.role" class="ml-4">
                    <el-radio label="普通用户">普通用户</el-radio>
                    <el-radio label="管理员">管理员</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-form>
        <template #footer>
            <el-button @click="addDialog.cancelDialog">取消</el-button>
            <el-button type="primary" @click="addDialog.addUser">
                确定
            </el-button>
        </template>
    </el-dialog>


    <el-dialog title="编辑用户信息" v-model="editDialog.visible" @close="editDialog.dialogClosed">
        <el-form ref="editFormRef" :rules="editDialog.formRules" :model="editDialog.form" label-width="80px">
            <el-form-item label="ID" prop="id">
                <el-input v-model="editDialog.form.id" disabled autocomplete="off"/>
            </el-form-item>
            <el-form-item label="姓名" prop="name">
                <el-input v-model="editDialog.form.name" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="昵称" prop="nick_name">
                <el-input v-model="editDialog.form.nick_name" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="用户等级" prop="role">
                <el-radio-group v-model="editDialog.form.role" class="ml-4">
                    <el-radio label="普通用户">普通用户</el-radio>
                    <el-radio label="管理员">管理员</el-radio>
                </el-radio-group>
            </el-form-item>
        </el-form>
        <template #footer>
            <el-button @click="editDialog.cancelDialog">取消</el-button>
            <el-button type="primary" @click="editDialog.editUser">
                确定
            </el-button>
        </template>
    </el-dialog>

    <el-dialog title="修改用户密码" v-model="passwordDialog.visible" @close="passwordDialog.dialogClosed">
        <el-form ref="passwordFormRef" :rules="passwordDialog.formRules" :model="passwordDialog.form"
                 label-width="80px">
            <el-form-item label="ID" prop="id">
                <el-input v-model="passwordDialog.form.id" disabled autocomplete="off"/>
            </el-form-item>
            <el-form-item label="姓名" prop="name">
                <el-input v-model="passwordDialog.form.name" disabled autocomplete="off"/>
            </el-form-item>
            <el-form-item label="新密码" prop="password">
                <el-input v-model="passwordDialog.form.password" type="password" show-password autocomplete="off"/>
            </el-form-item>
            <el-form-item label="确认密码" prop="againPassword">
                <el-input v-model="passwordDialog.form.againPassword" type="password" show-password autocomplete="off"/>
            </el-form-item>
        </el-form>
        <template #footer>
            <el-button @click="passwordDialog.cancelDialog">取消</el-button>
            <el-button type="primary" @click="passwordDialog.changePassword">
                确定
            </el-button>
        </template>
    </el-dialog>


</template>

<script>
import {reactive, ref} from 'vue';
import {addUser, changePasswords, delUser, editUser, getUserLists} from '@/api/user'
import {ElMessage, ElMessageBox} from 'element-plus'

export default {
    setup() {
        const queryInfo = reactive({
            query: '',
            pagenum: 1,
            pagesize: 5
        })
        const users = ref([])
        const total = ref(0)

        async function getUserList() {
            const {data} = await getUserLists(queryInfo)
            if (data.status === 0) {
                users.value = data.data
                total.value = data.total
                ElMessage({message: data.message, type: "success"});

            } else {
                ElMessage({message: '获取用户数据失败！', type: "error"});

            }

        }

        getUserList()

        function handleSizeChange(newSize) {
            queryInfo.pagesize = newSize;
            getUserList();
        }

        function handleCurrentChange(current) {
            queryInfo.pagenum = current;
            getUserList();
        }

        // 添加用户
        const addFormRef = ref()
        const addDialog = reactive({
            visible: false,
            form: {
                name: '',
                nick_name: '',
                password: '',
                againPassword: '',
                role: '普通用户',
            },
            formRules: {
                name: [
                    {required: true, message: "请输入用户名称", trigger: "blur"},
                    {min: 2, max: 10, message: "用户名在2-10个字符之间", trigger: "blur",}
                ],
                nick_name: [
                    {min: 1, max: 12, message: "昵称在1-12个字符之间", trigger: "blur",}
                ],
                password: [
                    {required: true, message: "请输入密码", trigger: "blur"},
                    {min: 6, max: 16, message: "密码在6-16个字符之间", trigger: "blur",}
                ],
                againPassword: [
                    {required: true, message: "请输入确认密码", trigger: "blur"},
                    {min: 6, max: 16, message: "确认密码在6-16个字符之间", trigger: "blur",},
                    {
                        validator: (rule, value, cb) => {
                            if (value === addDialog.form.password) {
                                return cb()
                            }
                            cb(new Error('两次输入的密码不一致'))
                        }, message: "两次输入的密码不一致", trigger: "blur",
                    }
                ],
            },
            dialogClosed: () => {
                addFormRef.value.resetFields()
            },

            addUser: () => {
                addFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "用户信息填写错误！", type: "error"});
                    }
                    const {data} = await addUser(addDialog.form);
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }

                    addDialog.visible = false
                    await getUserList();
                })

            },
            cancelDialog: () => {
                ElMessage({message: "取消添加用户！", type: "info"});
                addDialog.visible = false
            }
        })
        // 编辑用户
        const editFormRef = ref()
        const editDialog = reactive({
            visible: false,
            form: {
                id: '',
                name: '',
                nick_name: '',
                role: '普通用户',
            },
            formRules: {
                id: [
                    {required: true, message: "请输入用户ID", trigger: "blur"},
                ],
                name: [
                    {required: true, message: "请输入用户名称", trigger: "blur"},
                    {min: 2, max: 10, message: "用户名在2-10个字符之间", trigger: "blur",}
                ],
                nick_name: [
                    {min: 1, max: 12, message: "昵称在1-12个字符之间", trigger: "blur",}
                ],
            },
            dialogClosed: () => {
                editFormRef.value.resetFields()
            },
            editUser: () => {
                editFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "用户信息填写错误！", type: "error"});
                    }
                    const {data} = await editUser(editDialog.form);

                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }
                    editDialog.visible = false
                    await getUserList();
                })
            },
            show: (row) => {
                editDialog.visible = true
                editDialog.form = {...row}

            },
            cancelDialog: () => {
                ElMessage({message: "取消编辑用户！", type: "info"});
                editDialog.visible = false
            }
        })


        const passwordFormRef = ref()
        const passwordDialog = reactive({
            visible: false,
            form: {
                id: '',
                name: '',
                password: '',
                againPassword: '',
            },
            formRules: {
                id: [
                    {required: true, message: "请输入用户ID", trigger: "blur"},
                ],
                name: [
                    {required: true, message: "请输入用户名称", trigger: "blur"},
                    {min: 2, max: 10, message: "用户名在2-10个字符之间", trigger: "blur",}
                ],
                password: [
                    {required: true, message: "请输入密码", trigger: "blur"},
                    {min: 6, max: 16, message: "密码在6-16个字符之间", trigger: "blur",}
                ],
                againPassword: [
                    {required: true, message: "请输入确认密码", trigger: "blur"},
                    {min: 6, max: 16, message: "确认密码在6-16个字符之间", trigger: "blur",},
                    {
                        validator: (rule, value, cb) => {
                            if (value === passwordDialog.form.password) {
                                return cb()
                            }
                            cb(new Error('两次输入的密码不一致'))
                        }, message: "两次输入的密码不一致", trigger: "blur",
                    }
                ],
            },
            dialogClosed: () => {
                passwordFormRef.value.resetFields()
            },
            show: (row) => {

                let loginName = window.localStorage.getItem('username')
                if ((loginName === row.name && row.role === '管理员') || row.role === '普通用户') {
                    passwordDialog.visible = true
                    passwordDialog.form = {...row}
                } else {
                    ElMessage({message: "无权修改其他管理员的密码！", type: "error"});
                }

            },
            changePassword: () => {
                passwordFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "用户密码填写错误！", type: "error"});
                    }

                    const {data} = await changePasswords(passwordDialog.form);

                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }
                    editDialog.visible = false
                    await getUserList();
                    passwordDialog.visible = false
                })
            },
            cancelDialog: () => {
                ElMessage({message: "取消修改用户密码！", type: "info"});
                passwordDialog.visible = false
            }
        })

        // 删除用户
        async function delUsers(row) {
            const confirmResult = await ElMessageBox({
                confirmButtonText: "确认删除",
                cancelButtonText: "取消",
                showCancelButton: true,
                type: "warning",
                title: "删除提示",
                message: "是否要删除该用户！",
            }).catch((err) => err);
            if (confirmResult !== "confirm") {
                return ElMessage({message: "取消删除用户！", type: "info"});
            }
            const {data} = await delUser({id: row.id});
            if (data.status === 0) {
                ElMessage({message: data.message, type: "success"});
            } else {

                ElMessage({message: data.message, type: "error"});
            }
            await getUserList();

        }

        return {
            queryInfo, users, getUserList,
            handleSizeChange, handleCurrentChange, total,
            addDialog, addFormRef,
            editDialog, editFormRef,
            passwordDialog, passwordFormRef,
            delUsers,
        }
    }
}
</script>

<style lang="scss" scoped>

</style>