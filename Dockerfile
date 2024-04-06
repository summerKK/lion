# 使用官方的 Golang 镜像作为基础镜像
FROM golang:latest

# 将当前目录下的脚本文件复制到镜像中的 /usr/src/app 目录下
COPY run.sh /usr/src/app/run.sh

# 设置工作目录为 /usr/src/app
WORKDIR /usr/src/app

# 在镜像中运行脚本文件
CMD ["bash", "run.sh"]