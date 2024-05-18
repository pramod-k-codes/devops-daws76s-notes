#!/bin/bash
# you need to use in brackets to execute properly
ID=$(id -u)

echo $ID
if [ "$ID" -ne 0 ]
  then echo "Please run as root"
  exit
fi