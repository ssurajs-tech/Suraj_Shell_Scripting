#!/bin/bash 

# Cleecting the disk usages for 
filesystem=("/" "/home" "/tmp")

for i in ${filesystem(@)};
do
    usage=`df -h $i | tail -n 1 | awk '{print $5}' | cut -d % -f1`
    if [ $usage -gt "90" ];
        alert="Running out of disk space on $i, Usage is $usage"
        echo "Sending out disk space alert"
        echo `$alert | mail -s "$i is $usage% full" ssurajs1008@gmail.com
    fi
done


