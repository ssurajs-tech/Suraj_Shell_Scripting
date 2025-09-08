#!/bin/bash 

# Collected servers
servers=$(cat serverlist)


mkdir -p /data
cd /data
for i in {1..10}; do
    touch "/data/files${i}.txt" || echo "Failed to create /data/files${i}.txt"
done
ls -l | awk {print $7} > files
for i in `cat files`;
do;
    echo $i;
    echo "Content" >> $i;
    cat $i;
done
-----------------------------------------
#!/bin/bash 

# Collected servers
servers=$(cat serverlist)

# For each server, create files and add content remotely
for host in $servers; do
    echo "Connecting to $host"
    ssh "$host" 'bash -s' <<'EOF'
mkdir -p /data
cd /data
for i in {1..10}; do
    touch "files${i}.txt" || echo "Failed to create files${i}.txt"
done
for i in files*.txt; do
    echo "$i"
    echo "Content" >> "$i"
    cat "$i"
done
EOF
done
------------------------------------------
#!/bin/bash

# Read server list
servers=$(cat serverlist)

for host in $servers; do
    echo "Connecting to $host"
    ssh "$host" 'bash -s' <<'EOF'
mkdir -p /data
cd /data
for i in {1..10}; do
    file="files${i}.txt"
    echo "Content" > "$file"
    echo "Created $file with content:"
    cat "$file"
done
EOF
done
-------------------------------------------
#!/bin/bash

# Prepare the script to be run remotely
cat <<'EOS' > remote_file_ops.sh
#!/bin/bash
mkdir -p /data
cd /data
for i in {1..10}; do
    file="files${i}.txt"
    echo "Content" > "$file"
    echo "Created $file with content:"
    cat "$file"
done
EOS

chmod +x remote_file_ops.sh

# Read server list and copy/execute the script
servers=$(cat serverlist)
for host in $servers; do
    echo "Copying and executing script on $host"
    scp remote_file_ops.sh "$host:/tmp/"
    ssh "$host" "bash /tmp/remote_file_ops.sh"
done

# Optionally, clean up the script locally
rm -f remote_file_ops.sh
--------------------------------------

#!/bin/bash

servers=$(cat serverlist)
ssh_user="your_ssh_username"
ssh_pass="your_ssh_password"
sudo_pass="your_sudo_password"

for host in $servers; do
    echo "Connecting to $host"
    sshpass -p "$ssh_pass" ssh -o StrictHostKeyChecking=no "$ssh_user@$host" "echo '$sudo_pass' | sudo -S bash -c '
        mkdir -p /data
        cd /data
        for i in {1..10}; do
            file=\"files\${i}.txt\"
            echo \"Content\" > \"\$file\"
            echo \"Created \$file with content:\"
            cat \"\$file\"
        done
    '"
done
---------------------------------------
#!/bin/bash

# List of remote hosts
servers=("servera" "serverb")
ssh_user="student"
ssh_pass="student"

for host in "${servers[@]}"; do
    echo "Connecting to $host"
    sshpass -p "$ssh_pass" ssh -o StrictHostKeyChecking=no "$ssh_user@$host" "echo '$ssh_pass' | sudo -S bash -c '
        mkdir -p /data
        cd /data
        for i in {1..10}; do
            file=\"files\${i}.txt\"
            echo \"Content\" > \"\$file\"
            echo \"Created \$file with content:\"
            cat \"\$file\"
        done
    '"
done
----------------------------------------
# Validation above scripts

ssh student@servera
ls -l /data/files*.txt
cat /data/files1.txt
cat /data/files10.txt

for host in "${servers[@]}"; do
    echo "Validating on $host"
    sshpass -p "$ssh_pass" ssh -o StrictHostKeyChecking=no "$ssh_user@$host" "for i in {1..10}; do
        if [ -f /data/files\${i}.txt ] && grep -q 'Content' /data/files\${i}.txt; then
            echo \"files\${i}.txt exists and contains 'Content'\"
        else
            echo \"Validation failed for files\${i}.txt\"
        fi
    done"
done

for i in {1..10}; do
    file="files${i}.txt"           # Set the filename, e.g., files1.txt, files2.txt, etc.
    echo "Content" > "$file"       # Write "Content" into the file (overwrites if it exists)
    echo "Created $file with content:"  # Print a message showing which file was created
    cat "$file"                    # Display the contents of the file
done
-----------------------------------------
#!/bin/bash

# List of remote hosts
servers=("servera" "serverb")
ssh_user="student"
ssh_pass="student"

for host in "${servers[@]}"; do
    echo "Connecting to $host for cleanup"
    sshpass -p "$ssh_pass" ssh -o StrictHostKeyChecking=no "$ssh_user@$host" "echo '$ssh_pass' | sudo -S bash -c '
        cd /data
        rm -f files{1..10}.txt
        echo \"Removed files1.txt to files10.txt from /data on $host\"
        ls -l /data/files*.txt 2>/dev/null || echo \"No files left in /data matching files*.txt\"
    '"
done
-------------------------------------------------------