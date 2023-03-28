#!/bin/bash

# 脚本名称：port-killer
# 脚本用途：根据端口杀掉对应的进程
# 创建日期：2023/03/29 05:54
# 作者：rosercode@gmail.com

if [ -z "$1" ]; then
    echo "请输入参数"
    exit 0
fi


# 判断
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "你输入的不是一个数字"
    exit 0
fi


if ! [ "$1" -ge 1 -a "$1" -le 65535 ]; then
    echo "请输入一个合适的端口 1-65535 的范围内。"
    exit 0
fi

process_pid=`lsof -i:$1 -t`

if [[ "$process_pid" == $'' ]]; then
    echo "该端口没有进程存在"
else
    kill -9 $process_pid
    if [ $? -eq 0 ]; then
        echo "该进程已经终止"
    else
        echo "命令执行失败。"
    fi
fi

exit 0