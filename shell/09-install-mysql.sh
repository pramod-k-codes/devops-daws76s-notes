#!/bin/bash
# you need to use in brackets to execute properly
EUID=$(id -u)

echo $EUID
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi