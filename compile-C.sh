#!/bin/bash

# 脚本名称：compile-C.sh
# 脚本用途：用于编译并执行 C 语言代码。
#          它接收一个源文件名作为参数，使用 gcc 编译器编译指定的源文件，并生成一个可执行文件。如果编译成功，则执行生成的可执行文件，并检查执行结果。
#          最后，删除生成的可执行文件。在执行过程中，如果发现源文件不存在，则输出相应的错误信息并退出程序。
# 创建日期：2023/03/29 19:29
# 作者：rosercode@gmail.com

# 检查参数数量是否正确
if [ $# -lt 1 ]; then
    echo "用法：$0 <源文件名>"
    exit 1
fi

# 设置编译器和编译选项
CC=gcc
CFLAGS="-Wall -Wextra -pedantic"

# 提取源文件名和去除扩展名
SRC_FILE=$1
BASE_NAME=$(basename "${SRC_FILE}")
FILE_NAME=${BASE_NAME%.*}

# 检查源文件是否存在
if [ ! -f ${SRC_FILE} ]; then
    echo "源文件 ${SRC_FILE} 不存在！"
    exit 1
fi

# 编译源文件
echo "正在编译 ${SRC_FILE} ..."
${CC} ${CFLAGS} ${SRC_FILE} -o ${FILE_NAME}

# 检查是否编译成功
if [ $? -eq 0 ]; then
    echo "编译成功！"
    # 如果编译通过，则执行生成的可执行文件
    ./${FILE_NAME}
    # 检查可执行文件是否执行成功
    if [ $? -eq 0 ]; then
        echo "执行成功！"
    else
        echo "执行失败！"
    fi
    # 删除可执行文件
    rm ${FILE_NAME}
else
    echo "编译失败！"
fi
