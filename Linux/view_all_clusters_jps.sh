#!/bin/bash
# 查看各个服务器 Java 进程的脚本：jpsall
for host in 192.168.66.101 192.168.66.102 192.168.66.103; do
    echo =============== $host ===============
    ssh $host /usr/local/jdk/bin/jps
done
