#!/bin/bash

files=("f1.txt" "f2.txt" "f3.txt" "f4.txt" "f5.txt")

echo ${files[4]}
echo ${files[3]}
echo ${files[2]}
echo ${files[1]}
echo ${files[0]}

# print out all the array elements at once
echo ${files[*]}

# print the total number of the files array elements
echo ${#files[@]}

# change the value of the first element of the files array to “a.txt” using the following assignment
files[0]="a.txt"
echo ${files[0]}