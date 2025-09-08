#!/bin/bash

echo "Enter a filename"
read filename
count_lines=$(wc -l $filename)
echo "Number of Lines: $count_lines"