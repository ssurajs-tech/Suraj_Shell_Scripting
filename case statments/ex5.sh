#!/bin/bash

if [ $# -lt 2 ]
then
        echo "Usage : $0 Signalnumber PID"
        exit
fi

# Case statement
# Signal number (expression)
case "$1" in

1)  echo "Sending SIGHUP signal....."
    kill -SIGHUP $2
    ;;
2)  echo  "Sending SIGINT signal....."
    kill -SIGINT $2
    ;;
3)  echo  "Sending SIGQUIT signal....."
    kill -SIGQUIT $2
    ;;
4) echo  "Sending SIGKILL signals....."
   kill -SIGKILL $2
   ;;
*) echo "Signal number $1 has not been processed"
   ;;
esac