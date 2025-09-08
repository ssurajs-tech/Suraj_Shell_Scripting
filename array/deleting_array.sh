#!/bin/bash

num=(1 2 3 4 5)
echo ${num[*]}

# delete the 3rd element of the num array by using the unset shell built-in command
unset num[2]
echo ${num[*]}