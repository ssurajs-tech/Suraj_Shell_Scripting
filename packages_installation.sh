#!/bin/bash

pacakges=("httpd" "firewalld" "maria-db")

for i in "${pacakges[@]}";
do
    yum install $i
done;

