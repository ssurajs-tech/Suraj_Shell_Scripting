#!/bin/bash

letter='c'
color='blue'
year=2020
PI=123
TODAY=$(date)

echo "Enter a year: "
read yy 

echo `cal $yy`
echo "$letter"
echo "$color"
echo "$year"
echo "$PI"
echo "$(whoami)"
-------------------------------------
#!/bin/bash

# List of remote servers
servers=(servera.lab.example.com serverb.lab.example.com)

# Script to execute remotely
remote_script='
letter="c"
color="blue"
year=2020
PI=123
TODAY=$(date)
echo "Enter a year: "
read yy
echo "$(cal $yy)"
echo "$letter"
echo "$color"
echo "$year"
echo "$PI"
echo "$(whoami)"
'

for server in "${servers[@]}"; do
    echo "Connecting to $server"
    ssh "$server" "bash -s" <<< "$remote_script"
done
-------------------------------------
#!/bin/bash

# 1. Create a file for remote hosts
cat <<EOF > remote_hosts.txt
servera.lab.example.com
serverb.lab.example.com
EOF

# 2. Create a script to be run on the remote hosts
cat <<'EOF' > remote_script.sh
#!/bin/bash
letter='c'
color='blue'
year=2020
PI=123
TODAY=$(date)
echo "Enter a year: "
read yy
echo "$(cal $yy)"
echo "$letter"
echo "$color"
echo "$year"
echo "$PI"
echo "$(whoami)"
EOF

chmod +x remote_script.sh

# 3. For loop to run the script on each remote host
while read host; do
    echo "Connecting to $host"
    ssh "$host" 'bash -s' < remote_script.sh
done