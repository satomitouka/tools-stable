#! /bin/bash
# By WJQSERVER-STUDIO_WJQSERVER
#https://github.com/WJQSERVER/tools-stable

# 导入配置文件
source "repo_url.conf"

# 获取当前版本并设置5秒超时
version=$(curl -s --max-time 5 ${repo_url}Version)
if [ $? -ne 0 ]; then
    version="unknown"  # 设置默认值或进行其他错误处理
fi

# 获取统计信息并设置5秒超时
total=$(curl -s --max-time 5 https://count.1888866.xyz/api/counter/total)
if [ $? -ne 0 ]; then
    total="unknown"  # 设置默认值或进行其他错误处理
fi

today=$(curl -s --max-time 5 https://count.1888866.xyz/api/counter/daily)
if [ $? -ne 0 ]; then
    today="unknown"  
fi

# 统计次数
response=$(curl -s --max-time 5 https://count.1888866.xyz/add)
if [ $? -ne 0 ]; then
    echo 
else
    echo 
fi

mikublue="\033[38;2;57;197;187m"
yellow='\033[33m'
white='\033[0m'
green='\033[0;32m'
blue='\033[0;34m'
red='\033[31m'
gray='\e[37m'

#彩色
mikublue(){
    echo -e "\033[38;2;57;197;187m\033[01m$1\033[0m"
}
white(){
    echo -e "\033[0m\033[01m$1\033[0m"
}
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
gray(){
    echo -e "\e[37m\033[01m$1\033[0m"
}
option(){
    echo -e "\033[32m\033[01m ${1}. \033[38;2;57;197;187m${2}\033[0m                \033[32m\033[01m ${3}. \033[38;2;57;197;187m${4}\033[0m"
}

clear

# 显示免责声明
echo -e "${red}免责声明：${mikublue}请阅读并同意以下条款才能继续使用本脚本。"
echo -e "${yellow}===================================================================="
echo -e "${mikublue}本脚本仅供学习和参考使用，作者不对其完整性、准确性或实用性做出任何保证。"
echo -e "${mikublue}使用本脚本所造成的任何损失或损害，作者不承担任何责任。"
echo -e "${mikublue}不提供/保证任何功能的可用性，安全性，有效性，合法性"
echo -e "${mikublue}当前版本为${white}  [${yellow} V.0.9 ${white}]  ${white}"
echo -e "${yellow}===================================================================="
sleep 1

#webserver
function webserver(){
    wget -O webserver_menu.sh ${repo_url}program/webserver/webserver_menu.sh && chmod +x webserver_menu.sh && ./webserver_menu.sh
}

#Docker管理WEBUI
function docker_manager_webui(){
    wget -O docker_manager_webui_menu.sh ${repo_url}program/docker_manager_webui/docker_manager_webui_menu.sh && chmod +x docker_manager_webui_menu.sh && ./docker_manager_webui_menu.sh
}

#Speedtest测速
function speedtest(){
    wget -O speedtest_menu.sh ${repo_url}program/speedtest/speedtest_menu.sh && chmod +x speedtest_menu.sh && ./speedtest_menu.sh
}

#SyncThing同步工具
function syncthing(){
    wget -O syncthing.sh ${repo_url}program/syncthing/syncthing.sh && chmod +x syncthing.sh && ./syncthing.sh
}

#
function (){
}

#
function (){
}

#
function (){
}

#返回主脚本
function back(){
    wget -O main.sh ${repo_url}main.sh && chmod +x main.sh && ./main.sh
}

#主菜单
function start_menu(){
    clear
    red " WJQserver Studio Linux工具箱"
    yellow " FROM: https://github.com/WJQSERVER-STUDIO/tools-stable "
    green " =================================================="
    option 1 "网站服务器/反代服务器" 2 "Docker管理WEBUI"
    option 3 "Speedtest测速" 4 "SyncThing同步工具"
    green " =================================================="
    option 0 "退出脚本"
    echo
    read -p " 请输入数字:" menuNumberInput
    case "$menuNumberInput" in
        1 )
           webserver
        ;;
        2 )
           docker_manager_webui
        ;;
        3 )
           speedtest
        ;;
        4 )
           syncthing
        ;;
        0 )
           back
        ;;
	
        * )
            clear
            red "请输入正确数字!"
            start_menu
        ;;
    esac
}
start_menu "first"
