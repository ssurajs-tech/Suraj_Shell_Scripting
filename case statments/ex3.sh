#!/bin/bash

DEPARTMENT=("Electronics and Communication" "Computer Science" "Information Technology")

for value in "${DEPARTMENT[@]}"
do 
  case $value in
    "Computer Science")
      echo -n "Computer Science "
      ;;

    "Electrical and Electronics Engineering" | "Electrical Engineering")
      echo -n "Electrical and Electronics Engineering or Electrical Engineering "
      ;;

    "Information Technology" | "Electronics and Communication")
      echo -n "Information Technology or Electronics and Communication "
      ;;

    *)
      echo -n "Invalid "
      ;;
  esac
done