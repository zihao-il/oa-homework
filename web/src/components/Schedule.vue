<template>

    <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/main' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/schedule' }">日程信息管理</el-breadcrumb-item>
    </el-breadcrumb>
    <el-card>
        <el-row :gutter="20">
            <el-col :span="7">
                <el-input placeholder="请输入查询的日程标题" @clear="getScheduleList" @keyup.enter="getScheduleList"
                          clearable
                          v-model='queryInfo.query'>
                    <template #append>
                        <el-button icon="Search" @click="getScheduleList"></el-button>
                    </template>
                </el-input>
            </el-col>
            <el-col :span="4">
                <el-button type="primary" icon="Plus" @click="addDialog.visible = true">添加日程信息</el-button>
            </el-col>
        </el-row>
        <el-table :data="contacts" border stripe>
            <el-table-column type="index"></el-table-column>
            <el-table-column sortable label="ID" prop="id"></el-table-column>
            <el-table-column sortable label="所属用户ID" prop="user_id"></el-table-column>
            <el-table-column sortable label="开始时间" prop="start_time"></el-table-column>
            <el-table-column sortable label="结束时间" prop="end_time"></el-table-column>
            <el-table-column label="日程标题" prop="title"></el-table-column>
            <el-table-column label="日程内容" prop="content"></el-table-column>
            <el-table-column sortable label="优先级别" prop="level" :filters="[
                 { text: '普通', value: '普通' },
                 { text: '重要', value: '重要' },
                ]" :filter-method="levelFilterTag">
                <template #default="scope">
                    <el-tag v-if="scope.row.level === '普通'" effect="dark" type="success">普通</el-tag>
                    <el-tag v-else effect="dark" type="danger">重要</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="备注" prop="remark"></el-table-column>
            <el-table-column sortable label="提醒时间" prop="remind_datetime"></el-table-column>
            <el-table-column sortable label="提醒次数" prop="remind_number"></el-table-column>
            <el-table-column sortable label="状态" prop="status" :filters="[
                 { text: '未开始', value: '未开始' },
                 { text: '进行中', value: '进行中' },
                 { text: '已结束', value: '已结束' },
                ]" :filter-method="statusFilterTag" >
                <template #default="scope">
                    <el-tag v-if="scope.row.status === '未开始'" effect="dark"  round type="warning">未开始</el-tag>
                    <el-tag v-else-if="scope.row.status === '进行中'" effect="dark" type="danger">进行中</el-tag>
                    <el-tag v-else effect="dark" type="info">已结束</el-tag>
                </template>
            </el-table-column>
            <el-table-column label="操作" width="200px">
                <template #default="scope">
                    <el-button type="primary" icon="Edit" @click="editDialog.show(scope.row)">编辑</el-button>
                    <el-button type="danger" icon="Delete" @click="delSchedules(scope.row)">删除</el-button>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange"
                       :current-page="queryInfo.pagenum" :page-sizes="[5, 10, 15, 20]" :page-size="queryInfo.pagesize"
                       layout="total, sizes, prev, pager, next, jumper" :total="total">
        </el-pagination>
    </el-card>

</template>

<script>
import {reactive, ref} from 'vue';
import {getScheduleLists,addSchedule,editSchedule,delSchedule} from '@/api/schedule'
import {getRole} from "@/api/user";
import {ElMessage, ElMessageBox} from 'element-plus'


export default {
    setup() {
        const statusFilterTag = (value, row) => {
            return row.status === value
        }
        const levelFilterTag = (value, row) => {
            return row.level === value
        }
        const queryInfo = reactive({
            query: '',
            pagenum: 1,
            pagesize: 5
        })
        const contacts = ref([])
        const total = ref(0)

        async function getScheduleList() {
            const {data} = await getScheduleLists(queryInfo)
            if (data.status === 0) {
                contacts.value = data.data
                total.value = data.total
                ElMessage({message: data.message, type: "success"});

            } else {
                ElMessage({message: '获取用户数据失败！', type: "error"});

            }

        }

        getScheduleList()

        function handleSizeChange(newSize) {
            queryInfo.pagesize = newSize;
            getScheduleList();
        }

        function handleCurrentChange(current) {
            queryInfo.pagenum = current;
            getScheduleList();
        }

        // 添加日程信息
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

            addScheduleText: () => {
                addFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "日程信息填写错误！", type: "error"});
                    }
                    let username = window.localStorage.getItem('username')
                    const {data} = await addSchedule({...addDialog.form, "username": username});
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }

                    addDialog.visible = false
                    await getScheduleList();
                })

            },
            cancelDialog: () => {
                ElMessage({message: "取消添加日程信息！", type: "info"});
                addDialog.visible = false
            }
        })
        // 编辑日程信息
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
            editScheduleText: () => {
                editFormRef.value.validate(async (valid) => {
                    if (!valid) {
                        return ElMessage({message: "日程信息填写错误！", type: "error"});
                    }
                    const {data} = await editSchedule(editDialog.form);
                    if (data.status === 0) {
                        ElMessage({message: data.message, type: "success"});
                    } else {

                        ElMessage({message: data.message, type: "error"});
                    }
                    editDialog.visible = false
                    await getScheduleList();
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
                ElMessage({message: "取消编辑日程信息！", type: "info"});
                editDialog.visible = false
            }
        })


        // 删除日程信息
        async function delSchedules(row) {
            const confirmResult = await ElMessageBox({
                confirmButtonText: "确认删除",
                cancelButtonText: "取消",
                showCancelButton: true,
                type: "warning",
                title: "删除提示",
                message: "是否要删除该日程信息！",
            }).catch((err) => err);
            if (confirmResult !== "confirm") {
                return ElMessage({message: "取消删除日程信息！", type: "info"});
            }
            const {data} = await delSchedule({'id': row.id, 'user_id': row.user_id});
            if (data.status === 0) {
                ElMessage({message: data.message, type: "success"});
            } else {

                ElMessage({message: data.message, type: "error"});
            }
            await getScheduleList();

        }

        return {
            queryInfo, contacts, getScheduleList,
            handleSizeChange, handleCurrentChange, total,
            addDialog, addFormRef,
            editDialog, editFormRef,
            delSchedules,
            statusFilterTag,levelFilterTag,
        }
    }
}
</script>

<style lang="scss" scoped>

</style>