#!/bin/bash

ID = id -u

ID=$(id -u)


echo ID
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi