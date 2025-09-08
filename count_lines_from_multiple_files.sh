#!/bin/bash

file1=$(wc -l $1)
file2=$(wc -l $2)
file3=$(wc -l $3)

echo "$#"

echo "Lines in file1: $file1"
echo "Lines in file2: $file2"
echo "Lines in file3: $file3"
