<template>
    <el-breadcrumb separator="/">
        <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
    </el-breadcrumb>

    <el-result title="github地址" sub-title="https://github.com/zihao-il/oa-homework">
        <template #icon>
            <el-image
                src="/favicon.ico"
            />
        </template>
        <template #extra>
            <el-button type="primary"><a href="https://github.com/zihao-il/oa-homework">点我</a></el-button>
        </template>
    </el-result>

</template>

<script>
export default {
    setup() {


        return {}
    }
}
</script>

<style lang="scss" scoped>
a {
    color: #FFFFFF;
}
</style>