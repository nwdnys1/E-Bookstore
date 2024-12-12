 # 使用官方 Nginx 镜像作为基础镜像 选用alpine而不是latest 是因为前者的镜像更为精简 拉取更快 同样的nginx latest有180M 而alpine只有40M
 FROM nginx:alpine

 # 复制自定义配置文件到容器 注意路径是相对路径 相对于指定的上下文路径 我的dockerfile在/root下
#  COPY nginx.conf /etc/nginx/nginx.conf

 # 暴露80端口（仅做声明）
 EXPOSE 80