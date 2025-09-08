#!/bin/bash

for i in `cat $1`;
do 
    echo "$i: "`ssh surajs@${i} uptime`;
    echo "$i: "`ssh surajs@${i} uname -r`;
    echo "$i: "`ssh surajs@${i} hostname`;
done
