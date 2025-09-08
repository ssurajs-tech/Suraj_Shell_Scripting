#!/bin/bash

# Assign user to the varible
username="surajs"

id $username &> /dev/null

if [ "$?" -eq 0 ];then
    echo "$username exists"
else   
    echo "$username does not exists"

    # Add user to the system
    useradd -m ${username}
    id $username
fi
----------------------------------
#!/bin/bash

# List of remote hosts
hosts=("servera.lab.example.com" "serverb.lab.example.com")

# Script to check and create user on remote hosts
remote_script='
username="surajs"
id $username &> /dev/null
if [ "$?" -eq 0 ]; then
    echo "$username exists"
else
    echo "$username does not exists"
    useradd -m ${username}
    id $username
fi
'

for host in "${hosts[@]}"; do
    echo "Connecting to $host"
    ssh "$host" "bash -s" <<< "$remote_script"
done
----------------------------------
remote_script='
username="surajs"
if id $username &> /dev/null; then
    echo "$username exists"
else
    echo "$username does not exists"
    echo "student" | sudo -S useradd -m ${username}
    sudo id $username
fi
'

for host in "${hosts[@]}"; do
    echo "Connecting to $host"
    ssh "$host" "bash -s" <<< "$remote_script"
done
----------------------------------------

#!/bin/bash

# List of remote hosts
hosts=("servera.lab.example.com" "serverb.lab.example.com")

# Script to remove user on remote hosts
remote_script='
username="surajs"
if id $username &> /dev/null; then
    echo "Removing user: $username"
    echo "student" | sudo -S userdel -r $username
    if [ $? -eq 0 ]; then
        echo "User $username removed successfully"
    else
        echo "Failed to remove user $username"
    fi
else
    echo "User $username does not exist"
fi
'

for host in "${hosts[@]}"; do
    echo "Connecting to $host"
    ssh "$host" "bash -s" <<< "$remote_script"
done


# Explanation:
# This script loops through the list of remote hosts. For each host, it connects via SSH and runs a script 
# that checks if the user surajs exists. If the user exists, it removes the user and their home directory
# using sudo userdel -r. The script prints a message indicating whether the removal was successful or if 
# the user did not exist. Make sure your SSH user has passwordless sudo rights for userdel on the remote hosts.'''