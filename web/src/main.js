import { createApp } from "vue";
import App from "./App.vue";
const app = createApp(App);
import 'default-passive-events'


// 引入 全局样式
import "./assets/base.css";

// 引入 ElementPlus 并 注册图标
import ElementPlus from "element-plus";
import "element-plus/dist/index.css";
// 使用中文语言包
import zhCn from 'element-plus/es/locale/lang/zh-cn'
app.use(ElementPlus,{locale:zhCn})

import * as ElementPlusIconsVue from "@element-plus/icons-vue";
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component);
}

// 引入 vue路由
import router from "./router";
app.use(router);

app.mount("#app");
