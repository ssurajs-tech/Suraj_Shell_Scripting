#!/bin/bash

backup_dir="/tmp/"
source_dir="/etc/"

# Create timestamped backup of the source directory 

tar -czf $backup_dir/backup_$(date +%Y%m%d_%H%M%S).tax.gz $source_dir

# Display the content of the /tmp
echo "Backup file:"
ls /tmp/*.gz
