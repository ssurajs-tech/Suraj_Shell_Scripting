#!/bin/bash

# Stored the list of the of the server in the array for fixed number of servers. 

serverlist=( servera.lab.example.com serverb.lab.example.com )

# Loop through the array and ping each server, if the server is unreachable send an email notification.
for i in ${serverlist[@]};
do 
    ping -c1 $i >> /dev/null 2>&1
    if [ $? -nq 0 ];then    
        echo "Sending Out an outage mail"
        echo "@i is unreachable" | mail -s $i surajss@gmail.com
    fi
done

# Alternatively, you can read the list of servers from a file named 'serverlist' and perform the same operation.

servers=$(cat serverlist)
for i in $servers;
do
    ping -c1 $i >> /dev/null 2>&1
    if [ $? -nq 0 ];then
        echo "Sending out an mail"
        echo "$i is unreachable" | mail -s $i surajs@gmail.com
    fi
done

