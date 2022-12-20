<template>


    <el-result title="233" sub-title="github地址">
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