import {fileURLToPath, URL} from "node:url";

import {defineConfig} from "vite";
import vue from "@vitejs/plugin-vue";

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [vue()],
    resolve: {
        alias: {
            "@": fileURLToPath(new URL("./src", import.meta.url)),
        },
    },
    server: {
        host: "0.0.0.0",
        compress: true,
        disableHostCheck: true,
        proxy: {
            "/api": {
                target: "http://127.0.0.1:9090/api/private/v1",
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/api/, ""),
            },
            "/my": {
                target: "http://127.0.0.1:9090/api/private/v1/my/",
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/my/, ""),
            },
            "/addr": {
                target: "http://127.0.0.1:9090/api/private/v1/addr/",
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/addr/, ""),
            },
            "/log": {
                target: "http://127.0.0.1:9090/api/private/v1/log/",
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/log/, ""),
            },
            "/schedules": {
                target: "http://127.0.0.1:9090/api/private/v1/schedules/",
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/schedules/, ""),
            },
        },
    },
});
