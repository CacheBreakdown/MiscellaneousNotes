#!/bin/bash
# 一键关机、重启 (提供参数 shutdown 或 reboot)
if [ $# -lt 1 ]; then
    echo "No Args Input..."
    exit
fi
case $1 in
"shutdown")
    echo " =================== shutdown now =================== "
    ssh 192.168.66.102 "echo \"root\" | shutdown -h now"
    ssh 192.168.66.103 "echo \"root\" | shutdown -h now"
    ssh 192.168.66.101 "echo \"root\" | shutdown -h now"
    ;;
"reboot")
    echo " =================== reboot now =================== "
    ssh 192.168.66.102 "echo \"root\" | reboot"
    ssh 192.168.66.103 "echo \"root\" | reboot"
    ssh 192.168.66.101 "echo \"root\" | reboot"
    ;;
*)
    echo "Input Args Error..."
    ;;
esac
