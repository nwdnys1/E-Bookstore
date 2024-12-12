#!/bin/bash

# 执行mvn install构建父模块下的所有子模块
echo "Running mvn install to build all modules..."

mvn clean install -DskipTests




cd /main-service


mvn spring-boot:run 

cd ..
  

echo "All modules started successfully."
