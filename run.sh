#!/bin/bash

# 定义变量
REPO_URL="git@github.com:aurora-develop/aurora.git"
EXECUTABLE="gpt-free"

# 函数：清理
clean() {
    echo "Cleaning..."
    rm -f "$EXECUTABLE"
    rm -rf tmp
}

# 函数：下载代码
download() {
    echo "Downloading code from $REPO_URL..."
    git clone "$REPO_URL" tmp
}

# 函数：更新依赖并整理
tidy() {
    echo "Tidying modules..."
    cd tmp && go mod tidy
}

# 函数：编译代码
build() {
    echo "Building executable..."
    go build -o "../$EXECUTABLE"
}

# 函数：清理临时目录
clean_tmp() {
    echo "Cleaning temporary directory..."
    cd ../ && rm -rf tmp
}

start(){
  ./$EXECUTABLE
}

# 主函数
main() {
    clean
    download
    tidy
    build
    clean_tmp
    start
}

# 执行主函数
main