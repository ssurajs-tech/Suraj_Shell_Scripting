#!/bin/bash

distros=("Ubuntu" "Red Hat" "Fedora" "Debian")
echo ${distros[*]}

# Adding element to the array
distros+=("kali")
echo ${distros[*]}