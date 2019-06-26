#!/bin/bash

mgt=`cat /etc/hosts | grep mgt | awk '{print $1}' | head -1`
mst=`cat /etc/hosts | grep mst | awk '{print $1}' | head -1`
cdap_vip=`cat /etc/hosts | grep vip | awk '{print $1}' | head -1`

output=`curl -u 'admin':'admin123' -H "X-Requested-By:ambari" -i http://$mgt:8080/api/v1/clusters/rafd004/components/KAFKA_BROKER | grep "host_name" | awk '{print $3}' | sed 's/"//g'`
port=6667
set -f
array=(${output//:/ })

echo ${array[1]}
