<template>

    <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/contact' }">联系人列表管理</el-breadcrumb-item>
    </el-breadcrumb>
    <el-card>
        <el-row :gutter="20">
            <el-col :span="7">
                <el-input placeholder="请输入查询的姓名" @clear="getContactList" @keyup.enter="getContactList" clearable
                          v-model='queryInfo.query'>
                    <template #append>
                        <el-button icon="Search" @click="getContactList"></el-button>
                    </template>
                </el-input>
            </el-col>
            <el-col :span="4">
                <el-button type="primary" icon="Plus" @click="addDialog.visible = true">添加联系人</el-button>
            </el-col>
        </el-row>
        <el-table :data="contacts" border stripe>
            <el-table-column type="index"></el-table-column>
            <el-table-column label="ID" prop="id"></el-table-column>
            <el-table-column label="所属用户ID" prop="user_id"></el-table-column>
            <el-table-column label="姓名" prop="name"></el-table-column>
            <el-table-column label="性别" prop="sex"></el-table-column>
            <el-table-column label="手机号" prop="mobile"></el-table-column>
            <el-table-column label="电子邮箱" prop="email"></el-table-column>
            <el-table-column label="QQ" prop="qq"></el-table-column>
            <el-table-column label="微信号" prop="weixin"></el-table-column>
            <el-table-column label="公司名称" prop="company"></el-table-column>
            <el-table-column label="通信地址" prop="address"></el-table-column>
            <el-table-column label="邮政编码" prop="post_code"></el-table-column>
            <el-table-column label="操作" width="200px">
                <template #default="scope">
                    <el-button type="primary" icon="Edit" @click="editDialog.show(scope.row)">编辑</el-button>
                    <el-button type="danger" icon="Delete" @click="delContacts(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                       :current-page="queryInfo.pagenum" :page-sizes="[5, 10, 15, 20]" :page-size="queryInfo.pagesize"
                       layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>
    </el-card>


    <el-dialog title="添加联系人信息" v-model="addDialog.visible" @close="addDialog.dialogClosed">
        <el-form ref="addFormRef" :rules="addDialog.formRules" :model="addDialog.form" label-width="80px">
            <el-form-item label="姓名" prop="name">
                <el-input v-model="addDialog.form.name" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="性别" prop="sex">
                <el-radio-group v-model="addDialog.form.sex" class="ml-4">
                    <el-radio label="男">男</el-radio>
                    <el-radio label="女">女</el-radio>
                </el-radio-group>
            </el-form-item>
            <el-form-item label="手机号" prop="mobile">
                <el-input v-model="addDialog.form.mobile" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="电子邮箱" prop="email">
                <el-input v-model="addDialog.form.email" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="QQ" prop="qq">
                <el-input v-model="addDialog.form.qq" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="微信号" prop="weixin">
                <el-input v-model="addDialog.form.weixin" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="公司名称" prop="company">
                <el-input v-model="addDialog.form.company" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="通信地址" prop="address">
                <el-input v-model="addDialog.form.address" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="邮政编码" prop="post_code">
                <el-input v-model="addDialog.form.post_code" autocomplete="off"/>
            </el-form-item>

        </el-form>
        <template #footer>
            <el-button @click="addDialog.cancelDialog">取消</el-button>
            <el-button type="primary" @click="addDialog.addUser">
                确定
            </el-button>
        </template>
    </el-dialog>


    <el-dialog title="编辑联系人信息" v-model="editDialog.visible" @close="editDialog.dialogClosed">
        <el-form ref="editFormRef" :rules="editDialog.formRules" :model="editDialog.form" label-width="80px">
            <el-form-item label="所属用户ID" prop="user_id">
                <el-input v-model="editDialog.form.user_id" :disabled=editDialog.isDisabled autocomplete="off"/>
            </el-form-item>
            <el-form-item label="姓名" prop="name">
                <el-input v-model="editDialog.form.name" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="性别" prop="sex">
                <el-radio-group v-model="editDialog.form.sex" class="ml-4">
                    <el-radio label="男">男</el-radio>
                    <el-radio label="女">女</el-radio>
                </el-radio-group>
            </el-form-item>
            <el-form-item label="手机号" prop="mobile">
                <el-input v-model="editDialog.form.mobile" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="电子邮箱" prop="email">
                <el-input v-model="editDialog.form.email" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="QQ" prop="qq">
                <el-input v-model="editDialog.form.qq" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="微信号" prop="weixin">
                <el-input v-model="editDialog.form.weixin" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="公司名称" prop="company">
                <el-input v-model="editDialog.form.company" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="通信地址" prop="address">
                <el-input v-model="editDialog.form.address" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="邮政编码" prop="post_code">
                <el-input v-model="editDialog.form.post_code" autocomplete="off"/>
            </el-form-item>
        </el-form>
        <template #footer>
            <el-button @click="editDialog.cancelDialog">取消</el-button>
            <el-button type="primary" @click="editDialog.editUser">
                确定
            </el-button>
        </template>
    </el-dialog>
</template>

<script>
import {reactive, ref} from 'vue';
import {addContact, delContact, editContact, getContactLists} from '@/api/contact'
import {getRole} from "@/api/user";
import {ElMessage, ElMessageBox} from 'element-plus'


export default {
    setup() {
        const queryInfo = reactive({
            query: '',
            pagenum: 1,
            pagesize: 5
        })
        const contacts = ref([])
        const total = ref(0)

        async function getContactList() {
            const {data} = await getContactLists(queryInfo)
            if (data.status === 0) {
                contacts.value = data.data
                total.value = data.total
                ElMessage({message: data.message, type: "success"});

            } else {
                ElMessage({message: '获取用户数据失败！', type: "error"});

            }

        }

        getContactList()

        function handleSizeChange(newSize) {
            queryInfo.pagesize = newSize;
            getContactList();
        }

        function handleCurrentChange(current) {
            queryInfo.pagenum = current;
            getContactList();
        }

        // 添加联系人
        const addFormRef = ref()
        const addDialog = reactive({
            visible: false,
            form: {
                name: '',
                sex: '男',
                mobile: '',
                email: '',
                qq: '',
                weixin: '',
                company: '',
                address: '',
                post_code: '',

            },
            formRules: {
                name: [
                    {required: true, message: "请输入姓名", trigger: "blur"},
                    {min: 2, max: 10, message: "姓名在2-10个字符之间", trigger: "blur",}
                ],
                mobile: [
                    {required: true, message: "请输入手机号", trigger: "blur"},
                    {pattern: /^1[0-9]{10}$/, message: "手机号格式错误", trigger: "blur",}
                ],
                email: [
                    {
                        pattern: /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                        message: "电子邮箱格式错误",
                        trigger: "blur",
                    }
                ],
                qq: [
                    {pattern: /^[1-9][0-9]{4,9}$/, message: "QQ号格式错误", trigger: "blur",}
                ],
                weixin: [
                    {pattern: /^[a-zA-Z][a-zA-Z0-9_-]{5,19}$/, message: "微信号格式错误", trigger: "blur",}
                ],
                post_code: [
                    {pattern: /^[0-9]{5}$/, message: "邮政编码格式错误", trigger: "blur",}
                ],
            },
            dialogClosed: () => {
                addFormRef.value.resetFields()
            },

            addUser: () => {
                addFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "联系人信息填写错误！", type: "error"});
                    }
                    let username = window.localStorage.getItem('username')
                    const {data} = await addContact({...addDialog.form, "username": username});
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }

                    addDialog.visible = false
                    await getContactList();
                })

            },
            cancelDialog: () => {
                ElMessage({message: "取消添加联系人！", type: "info"});
                addDialog.visible = false
            }
        })
        // 编辑联系人
        const editFormRef = ref()
        const editDialog = reactive({
            visible: false,
            isDisabled: true,
            form: {
                user_id: '',
                name: '',
                sex: '男',
                mobile: '',
                email: '',
                qq: '',
                weixin: '',
                company: '',
                address: '',
                post_code: '',
            },
            formRules: {
                user_id: [
                    {required: true, message: "请输入所属用户ID", trigger: "blur"},
                    {pattern: /^[0-9]{1,6}$/, message: "所属用户ID格式错误", trigger: "blur",}
                ],
                name: [
                    {required: true, message: "请输入姓名", trigger: "blur"},
                    {min: 2, max: 10, message: "姓名在2-10个字符之间", trigger: "blur",}
                ],
                mobile: [
                    {required: true, message: "请输入手机号", trigger: "blur"},
                    {pattern: /^1[0-9]{10}$/, message: "手机号格式错误", trigger: "blur",}
                ],
                email: [
                    {
                        pattern: /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                        message: "电子邮箱格式错误",
                        trigger: "blur",
                    }
                ],
                qq: [
                    {pattern: /^[1-9][0-9]{4,9}$/, message: "QQ号格式错误", trigger: "blur",}
                ],
                weixin: [
                    {pattern: /^[a-zA-Z][a-zA-Z0-9_-]{5,19}$/, message: "微信号格式错误", trigger: "blur",}
                ],
                post_code: [
                    {pattern: /^[0-9]{5}$/, message: "邮政编码格式错误", trigger: "blur",}
                ],
            },
            dialogClosed: () => {
                editFormRef.value.resetFields()
            },
            editUser: () => {
                editFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "联系人信息填写错误！", type: "error"});
                    }
                    const {data} = await editContact(editDialog.form);
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }
                    editDialog.visible = false
                    await getContactList();
                })
            },
            show: async (row) => {
                editDialog.visible = true
                const {data} = await getRole();
                if (data.data.role === '管理员') {
                    editDialog.isDisabled = false

                }
                editDialog.form = {...row}

            },
            cancelDialog: () => {
                ElMessage({message: "取消编辑联系人！", type: "info"});
                editDialog.visible = false
            }
        })


        // 删除联系人
        async function delContacts(row) {
            const confirmResult = await ElMessageBox({
                confirmButtonText: "确认删除",
                cancelButtonText: "取消",
                showCancelButton: true,
                type: "warning",
                title: "删除提示",
                message: "是否要删除该联系人！",
            }).catch((err) => err);
            if (confirmResult !== "confirm") {
                return ElMessage({message: "取消删除联系人！", type: "info"});
            }
            const {data} = await delContact({'id': row.id, 'user_id': row.user_id});
            if (data.status === 0) {
                ElMessage({message: data.message, type: "success"});
            } else {

                ElMessage({message: data.message, type: "error"});
            }
            await getContactList();

        }

        return {
            queryInfo, contacts, getContactList,
            handleSizeChange, handleCurrentChange, total,
            addDialog, addFormRef,
            editDialog, editFormRef,
            delContacts,
        }
    }
}
</script>

<style lang="scss" scoped>

</style>