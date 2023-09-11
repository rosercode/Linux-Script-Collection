#!/bin/bash

# 脚本名称：run_in_background.sh
# 脚本用途：启动一个命令在后台运行并将输出重定向到日志文件
# 创建日期：2023/09/11 11:13
# 作者：rosercode@gmail.com
# 使用示例：
# 1. 在后台运行一个Python脚本，并将输出重定向到默认日志文件 api.log：
#    ./run_in_background.sh "python3 app.py"
#
# 2. 在后台运行一个Python脚本，并将输出重定向到自定义日志文件 custom.log：
#    ./run_in_background.sh "python3 app.py" custom.log

# 检查是否提供了足够的参数
if [ $# -lt 1 ]; then
  echo "Usage: $0 <command_to_execute> [output_file]"
  exit 1
fi

# 从命令行参数中获取要执行的命令
command="$1"

# 检查是否提供了输出文件名，如果没有则使用默认值 "api.log"
if [ $# -eq 1 ]; then
  log_file="api.log"
else
  log_file="$2"
fi

# 执行命令，将标准输出和标准错误追加到日志文件
nohup $command >> "$log_file" 2>&1 &

# 输出信息，告诉用户命令已经在后台运行
echo "Command '$command' is running in the background. Output is being logged to '$log_file'."