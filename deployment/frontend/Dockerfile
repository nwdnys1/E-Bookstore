# 使用 Node.js 官方镜像作为基础镜像
FROM node:18-alpine

# 设置 npm 镜像源
RUN npm config set registry https://registry.npmmirror.com/

# 创建应用目录
WORKDIR /frontend

# 复制构建产物到容器中
COPY dist ./dist

# 复制其他必要的文件，如 server.js
COPY server.js .

# 安装应用依赖
RUN npm install express

# 暴露端口
EXPOSE 3000

# 启动 Express 服务器
CMD ["node", "server.js"]