#!/bin/bash

file1="f1.txt"
file2="f2.txt"
file3="f3.txt"
file4="f4.txt"
file5="f5.txt"

touch $file1
touch $file2
touch $file3
touch $file4
touch $file5

files=("f1.txt" "f2.txt" "f3.txt" "f4.txt" "f5.txt")

echo ${files[1]}
echo ${files[2]}

echo "All files: ${files[*]}"
echo "All files using @: ${files[@]}"
echo "Total number of files: ${#files[@]}"
