# 使用官方 Ubuntu 基础镜像
FROM ubuntu:latest

# 将当前目录下的脚本文件复制到镜像中的 /usr/src/app 目录下
COPY gpt-free /usr/src/app/gpt-free

# 设置工作目录为 /usr/src/app
WORKDIR /usr/src/app

# 在镜像中运行脚本文件
CMD ["gpt-free-linux"]