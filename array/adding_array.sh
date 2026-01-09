#!/bin/bash

distros=("Ubuntu" "Red Hat" "Fedora" "Debian")
echo ${distros[*]}
echo " "

# Adding element to the array
distros+=("kali")

echo ${distros[*]}

echo "Difference between \${array[*]} and \${array[@]}"
echo " "

for distro in "${distros[*]}"; do
    echo "how it behaves: $distro"
done

for item in "${distros[@]}"; do
    echo "How it behaves: $item"
done
