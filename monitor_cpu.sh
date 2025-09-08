#!/bin/bash

cpu_threshold=90
cpu_usages=`top -bn1 | grep  "Cpu(s)" | cut -d, -f2 | awk '{print $1}' | cut -d. -f1`

if [ $cpu_usages -gt $cpu_threshold ]; then
    echo "Cpu is high on the server"
    echo 'mail "alerts"'

else
    echo "Cpu is normal"
fi