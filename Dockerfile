# 使用 Go 1.21 官方镜像作为构建环境
FROM golang:1.21-bullseye

# 设置工作目录为 /usr/src/app
WORKDIR /usr/src/app

# 将当前目录下的脚本文件复制到镜像中的 /usr/src/app 目录下
COPY gpt-free-linux /usr/src/app/gpt-free-linux

RUN chmod +x /usr/src/app/gpt-free-linux

# 在镜像中运行脚本文件
CMD ["/usr/src/app/gpt-free-linux"]