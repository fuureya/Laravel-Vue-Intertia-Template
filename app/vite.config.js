import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";
import vue from "@vitejs/plugin-vue";
import path from "path";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
    server: {
        host: "0.0.0.0",
        port: 5173,
        strictPort: true,

        hmr: {
            host: "127.0.0.1",
            protocol: "ws",
        },
    },
    plugins: [
        tailwindcss(),
        vue(),
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
    ],
    resolve: {
        alias: {
            "@": path.resolve(__dirname, "resources/js"), // opsional, untuk import alias
        },
    },
});
