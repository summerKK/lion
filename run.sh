#!/bin/bash

# 定义变量
CURRENT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REPO_URL="https://github.com/aurora-develop/aurora/archive/refs/heads/main.zip"
EXECUTABLE="$CURRENT_DIR/gpt-free"
TMP_DIR="$CURRENT_DIR/tmp"
SOURCE_CODE_DIR="$TMP_DIR/aurora-main"

# 函数：清理
clean() {
    echo "Cleaning..."
    rm -f "$EXECUTABLE"
    rm -rf "$TMP_DIR"
}

# 函数：下载代码
download() {
    echo "Downloading and extracting code from $REPO_URL..."
    mkdir -p "$TMP_DIR"
    curl -sL "$REPO_URL" -o "$TMP_DIR/code.zip"
    unzip -q "$TMP_DIR/code.zip" -d "$TMP_DIR"
    mv "$SOURCE_CODE_DIR"/* "$TMP_DIR"
    rm -rf "$SOURCE_CODE_DIR"
}

# 函数：更新依赖并整理
tidy() {
    echo "Tidying modules..."
    cd "$TMP_DIR" && go mod tidy
}

# 函数：编译代码
build() {
    echo "Building executable..."
    go build -o "$EXECUTABLE"
}

# 函数：清理临时目录
clean_tmp() {
    echo "Cleaning temporary directory..."
    rm -rf "$TMP_DIR"
}

start(){
  $EXECUTABLE
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