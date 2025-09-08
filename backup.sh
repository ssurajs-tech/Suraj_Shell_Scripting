#!/bin/bash

# folders from which we are taking the backup
backup_dir=("/home" "/etc" "/boot")
dest_dir="/backup"
remote_server="server1"
backup_date=`date +%b-%d-%y`

echo "Starting the backup of the folders: ${backup_dir(@)}"

for i in "${backup_dir(@)}";
do
    sudo tar -Pczf /tmp/$i-$bacjup_date.tar.gz $remote_server:$dest_dir
    if [ $? -eq 0 ]
        echo "Backup is successed"
    else
        echo "Backup Failed"
    fi  
done

sudo rm -rf /tmp/*
echo "Backup is done"

# crontab -e
# "* * * * * /scripts"  