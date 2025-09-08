#!/bin/bash

for i in ``cat /etc/passwd | cut -d: -f1`;
do
    sudo -l -U "$i" | grep -q not\ allowed && CAN_SUDO="" || CAN_SUDO="sudo"
    echo "$i            $CAN_SUDO"
done