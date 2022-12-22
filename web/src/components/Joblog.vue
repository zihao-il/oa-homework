<template>
    <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/joblog' }">工作日志管理列表</el-breadcrumb-item>
    </el-breadcrumb>
    <el-card>
        <el-row :gutter="20">
            <el-col :span="7">
                <el-input placeholder="请输入查询的日志标题" @clear="getJobLogList" @keyup.enter="getJobLogList"
                          clearable
                          v-model='queryInfo.query'>
                    <template #append>
                        <el-button icon="Search" @click="getJobLogList"></el-button>
                    </template>
                </el-input>
            </el-col>
            <el-col :span="4">
                <el-button type="primary" icon="Plus" @click="addDialog.visible = true">添加工作日志</el-button>
            </el-col>
        </el-row>
        <el-table :data="contacts" border stripe>
            <el-table-column type="index"></el-table-column>
            <el-table-column label="ID" prop="id"></el-table-column>
            <el-table-column label="所属用户ID" prop="user_id"></el-table-column>
            <el-table-column label="记录时间" prop="log_time"></el-table-column>
            <el-table-column label="日志标题" prop="title"></el-table-column>
            <el-table-column label="日志内容" prop="content"></el-table-column>
            <el-table-column label="操作" width="200px">
                <template #default="scope">
                    <el-button type="primary" icon="Edit" @click="editDialog.show(scope.row)">编辑</el-button>
                    <el-button type="danger" icon="Delete" @click="delJobLogs(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                       :current-page="queryInfo.pagenum" :page-sizes="[5, 10, 15, 20]" :page-size="queryInfo.pagesize"
                       layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>
    </el-card>

    <el-dialog title="添加工作日志" v-model="addDialog.visible" @close="addDialog.dialogClosed">
        <el-form ref="addFormRef" :rules="addDialog.formRules" :model="addDialog.form" label-width="80px">
            <el-form-item label="日志标题" prop="title">
                <el-input v-model="addDialog.form.title" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="记录时间" prop="log_time">

                <el-date-picker v-model="addDialog.form.log_time" :editable=false type="datetime"
                                placeholder="请选择记录时间"/>
                <!-- 此标签会导致控制台有提示，不知道咋解决-->
                <!-- 安装 'default-passive-events' 并在main.js引用解决-->

            </el-form-item>
            <el-form-item label="日志内容" prop="content">
                <el-input v-model="addDialog.form.content" type="textarea" autocomplete="off"/>
            </el-form-item>

        </el-form>
        <template #footer>
            <el-button @click="addDialog.cancelDialog">取消</el-button>
            <el-button type="primary" @click="addDialog.addUser">
                确定
            </el-button>
        </template>
    </el-dialog>
    <el-dialog title="添加联系人信息" v-model="editDialog.visible" @close="editDialog.dialogClosed">
        <el-form ref="editFormRef" :rules="editDialog.formRules" :model="editDialog.form" label-width="80px">
            <el-form-item label="所属用户ID" prop="user_id">
                <el-input v-model="editDialog.form.user_id" :disabled=editDialog.isDisabled autocomplete="off"/>
            </el-form-item>
            <el-form-item label="日志标题" prop="title">
                <el-input v-model="editDialog.form.title" autocomplete="off"/>
            </el-form-item>
            <el-form-item label="记录时间" prop="log_time">
                <el-date-picker v-model="editDialog.form.log_time" type="datetime" placeholder="请选择记录时间"/>
            </el-form-item>
            <el-form-item label="日志内容" prop="content">
                <el-input v-model="editDialog.form.content" type="textarea" autocomplete="off"/>
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
import {addJobLog, delJobLog, editJobLog, getJobLogLists} from '@/api/joblog'
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

        async function getJobLogList() {
            const {data} = await getJobLogLists(queryInfo)
            if (data.status === 0) {
                contacts.value = data.data
                total.value = data.total
                ElMessage({message: data.message, type: "success"});

            } else {
                ElMessage({message: '获取用户数据失败！', type: "error"});

            }

        }

        getJobLogList()

        function handleSizeChange(newSize) {
            queryInfo.pagesize = newSize;
            getJobLogList();
        }

        function handleCurrentChange(current) {
            queryInfo.pagenum = current;
            getJobLogList();
        }

        // 添加工作日志
        const addFormRef = ref()
        const addDialog = reactive({
            visible: false,
            form: {
                title: '',
                log_time: '',
                content: '',

            },
            formRules: {
                title: [
                    {required: true, message: "请输入日志标题", trigger: "blur"},
                    {min: 2, max: 15, message: "日志标题在2-15个字符之间", trigger: "blur",}
                ],
                log_time: [
                    {required: true, message: "请选择日志时间", trigger: "blur"},

                ],
                content: [
                    {required: true, message: "请选择日志时间", trigger: "blur"},
                    {pattern: /^.+/, message: "日志内容格式错误", trigger: "blur",}
                ],


            },
            dialogClosed: () => {
                addFormRef.value.resetFields()
            },

            addUser: () => {
                addFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "工作日志填写错误！", type: "error"});
                    }
                    let username = window.localStorage.getItem('username')
                    const {data} = await addJobLog({...addDialog.form, "username": username});
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }

                    addDialog.visible = false
                    await getJobLogList();
                })

            },
            cancelDialog: () => {
                ElMessage({message: "取消添加工作日志！", type: "info"});
                addDialog.visible = false
            }
        })
        // 编辑工作日志
        const editFormRef = ref()
        const editDialog = reactive({
            visible: false,
            isDisabled: true,
            form: {
                user_id: '',
                title: '',
                log_time: '',
                content: '',
            },
            formRules: {
                user_id: [
                    {required: true, message: "请输入所属用户ID", trigger: "blur"},
                    {pattern: /^[0-9]{1,6}$/, message: "所属用户ID格式错误", trigger: "blur",}
                ],
                title: [
                    {required: true, message: "请输入日志标题", trigger: "blur"},
                    {min: 2, max: 15, message: "日志标题在2-15个字符之间", trigger: "blur",}
                ],
                log_time: [
                    {required: true, message: "请选择日志时间", trigger: "blur"},

                ],
                content: [
                    {required: true, message: "请选择日志时间", trigger: "blur"},
                    {pattern: /^.+/, message: "日志内容格式错误", trigger: "blur",}
                ],
            },
            dialogClosed: () => {
                editFormRef.value.resetFields()
            },
            editUser: () => {
                editFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "工作日志填写错误！", type: "error"});
                    }
                    const {data} = await editJobLog(editDialog.form);
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }
                    editDialog.visible = false
                    await getJobLogList();
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
                ElMessage({message: "取消编辑工作日志！", type: "info"});
                editDialog.visible = false
            }
        })


        // 删除工作日志
        async function delJobLogs(row) {
            const confirmResult = await ElMessageBox({
                confirmButtonText: "确认删除",
                cancelButtonText: "取消",
                showCancelButton: true,
                type: "warning",
                title: "删除提示",
                message: "是否要删除该工作日志！",
            }).catch((err) => err);
            if (confirmResult !== "confirm") {
                return ElMessage({message: "取消删除工作日志！", type: "info"});
            }
            const {data} = await delJobLog({'id': row.id, 'user_id': row.user_id});
            if (data.status === 0) {
                ElMessage({message: data.message, type: "success"});
            } else {

                ElMessage({message: data.message, type: "error"});
            }
            await getJobLogList();

        }

        return {
            queryInfo, contacts, getJobLogList,
            handleSizeChange, handleCurrentChange, total,
            addDialog, addFormRef,
            editDialog, editFormRef,
            delJobLogs,
        }
    }
}
</script>

<style lang="scss" scoped>

</style>