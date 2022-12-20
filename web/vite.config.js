import { fileURLToPath, URL } from "node:url";

import { defineConfig } from "vite";
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
        target: "http://127.0.0.1:9090/api/",
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, ""),
      },
      "/my": {
        target: "http://127.0.0.1:9090/my/",
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/my/, ""),
      },
    },
  },
});
