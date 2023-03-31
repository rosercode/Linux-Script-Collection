#!/bin/bash

# 脚本名称：ip_location.sh
# 脚本用途：获取当前主机出口的公网 ip 地址，及相应的归属地
# 创建日期：2023/03/31 09:22
# 作者：rosercode@gmail.com


# 判断 jq 是否已安装
if ! command -v jq &> /dev/null
then
    echo "jq 未安装，请先安装 jq"
    exit
fi

# 获取本机 IP 地址
ip=$(curl -s ifconfig.me)

# 查询 IP 地址的归属地
response=$(curl -s "https://ipwhois.app/json/$ip")
region=$(echo $response | jq -r '.region')
country=$(echo $response | jq -r '.country')

# 输出结果
echo "本机 IP 地址为 $ip，归属地为 $country $region"
