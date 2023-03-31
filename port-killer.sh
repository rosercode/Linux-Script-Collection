#!/bin/bash

# 脚本名称：port-killer.sh
# 脚本用途：根据端口杀掉对应的进程
# 创建日期：2023/03/29 05:54
# 作者：rosercode@gmail.com

# 检查参数
if [ -z "$1" ]; then
    echo "请输入参数"
    exit 1
fi

# 检查端口号
function check_port {
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then
        echo "端口号必须是一个数字"
        exit 1
    fi

    if ! [ "$1" -ge 1 -a "$1" -le 65535 ]; then
        echo "端口号必须在 1-65535 范围内"
        exit 1
    fi
}

# 获取进程 PID
function get_process_pid {
    local pid=`lsof -i:$1 -t`
    echo $pid
}

# 杀死进程
function kill_process {
    kill -9 $1
    if [ $? -eq 0 ]; then
        echo "进程 $1 已经终止"
    else
        echo "命令执行失败。"
        exit 1
    fi
}

# 主函数
function main {
    check_port $1
    process_pid=`get_process_pid $1`
    if [[ "$process_pid" == $'' ]]; then
        echo "该端口没有进程存在"
    else
        kill_process $process_pid
    fi
    exit 0
}

main $1