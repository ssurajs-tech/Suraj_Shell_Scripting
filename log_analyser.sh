#!/bin/bash

logfile="/var/log/error.log"

# filter the error messages 
grep -i error /var/log/messages > $logfile

cat $logfile