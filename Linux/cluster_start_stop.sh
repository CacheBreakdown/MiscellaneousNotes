# Hadoop 集群启动、停止脚本（HDFS，Yarn，Historyserver）
#!/bin/bash
if [ $# -lt 1 ]
then
 echo "No Args Input..."
 exit ;
fi
case $1 in
"start")
 echo " =================== 启动 hadoop 集群 =================== "
 echo " ------------------- 启动 hdfs ------------------- "
 ssh 192.168.66.101 "/usr/local/hadoop/sbin/start-dfs.sh"
 echo " ------------------- 启动 yarn ------------------- "
ssh 192.168.66.102 "/usr/local/hadoop/sbin/start-yarn.sh"
 echo " ------------------- 启动 historyserver ------------------- "
 ssh 192.168.66.101 "/usr/local/hadoop/bin/mapred --daemon start historyserver"
;;
"stop")
 echo " =================== 关闭 hadoop 集群 =================== "
 echo " ------------------- 关闭 historyserver ------------------- "
 ssh 192.168.66.101 "/usr/local/hadoop/bin/mapred --daemon stop historyserver"
 echo " ------------------- 关闭 yarn ------------------- "
 ssh 192.168.66.102 "/usr/local/hadoop/sbin/stop-yarn.sh"
 echo " ------------------- 关闭 hdfs ------------------- "
 ssh 192.168.66.101 "/usr/local/hadoop/sbin/stop-dfs.sh"
;;
*)
 echo "Wrong Parameter Inputed......"
;;
esac