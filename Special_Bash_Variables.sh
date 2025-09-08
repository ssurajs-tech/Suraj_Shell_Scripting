#  Special variable       Description
-------------------------------------------------------------
#  $0                     The name of the bash script.
#  $1, $2...$n            The bash script arguments.
#  $$                     The process id of the current shell.
#  $#                     The total number of arguments passed to the script.
#  $@                     The value of all the arguments passed to the script.
#  $?                     The exit status of the last executed command.
#  $!                     The process id of the last executed command

#!/bin/bash

# Display the name of the script
echo "Name of the script: $0"

# Display the total number of arguments passed to the script
echo "Total number of arguments: $#"

# Display the values of all the arguments passed to the script
echo "Values of all the arguments: $@"

# Display the process ID of the current shell
echo "Process ID of the current shell: $$"

# Display the exit status of the last executed command
echo "Exit status of the last executed command: $?"

# Display the process ID of the last executed background command
echo "Process ID of the last executed background command: $!"

# Example usage of arguments
if [ $# -gt 0 ]; then
    echo "First argument: $1"
    echo "Second argument: $2"
fi

# Example of a background command
sleep 5 &
echo "Process ID of the sleep command: $!"

# Example of checking the exit status of a command
ls /nonexistent_directory
echo "Exit status of the 'ls' command: $?"