#!/bin/bash
# you need to use in brackets to execute properly
ID=$(id -u)

echo $EUID # Also returns the current user to determine its root or not
echo $ID
if [ "$ID" -ne 0 ]
  then echo "Please run as root"
  exit 
fi
yum install mysql -y

# validation of the installation

if [ "$?" -ne 0 ]
then 

    echo "Installation failed"
    exit 1

fi  

yum install firefox -y
if [ "$?" -ne 0 ]
then 
  echo "Installation failed"
  exit 1
fi