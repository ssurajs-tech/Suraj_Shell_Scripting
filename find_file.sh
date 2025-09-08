#!/bin/bash

find / -iname $1 2> /dev/null

#  2> /dev/null, it means that any error message (like file cannot be accessed) won’t be displayed on the screen.