# 使用官方的 OpenJDK 作为基础镜像
FROM openjdk:17-jdk-alpine

# 设置工作目录 相当于在当前目录进行指令 'cd backend'
WORKDIR /backend

# 将应用程序的 JAR 文件添加到工作目录 我的上下文路径是ebookstore/backend
COPY backend-0.0.1-SNAPSHOT.jar /backend/ebook-backend.jar

# 运行 JAR 文件
CMD ["java", "-jar", "ebook-backend.jar"]

# 暴露端口
EXPOSE 8080