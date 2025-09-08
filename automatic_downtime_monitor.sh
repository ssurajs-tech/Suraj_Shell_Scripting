#!/bin/bash

serverlist=( servera.lab.example.com serverb.lab.example.com )

for i in ${serverlist[@]};
do 
    ping -c1 $i >> /dev/null 2>&1
    if [ $? -nq 0 ];then    
        echo "Sending Out an outage mail"
        echo "@i is unreachable" | mail -s $i surajss@gmail.com
    fi
done

servers=$(cat serverlist)
for i in $servers;
do
    ping -c1 $i >> /dev/null 2>&1
    if [ $? -nq 0 ];then
        echo "Sending out an mail"
        echo "$i is unreachable" | mail -s $i surajs@gmail.com
    fi
done

