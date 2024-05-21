#!/bin/bash

#function defenition needs to be on top in shell script
IS_ROOT_USER(){
    ID=$(id -u) 
    DATE-$(date +%F)
    echo "$DATE"
    echo "checking if user is root"
    echo $ID
    if [ $ID -eq 0 ]
    then
        echo "user is root"
    else
        echo "user is not root"
        exit 1;
    fi
}

INSTALL_APPLICATION(){
    IS_ROOT_USER
    echo "installing application $1"
    yum install $1 -y 
    VALIDATE_INSTALLATION $? $1
}

VALIDATE_INSTALLATION(){
    if [ $1 -eq 0 ]
    then
        echo "application $2 is installed"
    else
        echo "application $2 is not installed"
        echo "Error: Unable to install $2" >> install_errors.log
    fi
}

IS_ROOT_USER # this will fail in shell script because in shell you have to define the function before calling , calling should always at the end of file
# INSTALL_APPLICATION "mysql"
# INSTALL_APPLICATION "firefox"
# INSTALL_APPLICATION "chrome"
# INSTALL_APPLICATION "firewall-d"
# INSTALL_APPLICATION "nginx"



