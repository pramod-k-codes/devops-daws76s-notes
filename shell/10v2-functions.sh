#!/bin/bash

# IS_ROOT_USER # this will fail in shell script because in shell you have to define the function before calling , calling should always at the end of file



IS_ROOT_USER(){
    # ID = $id -u
    echo "checking if user is root"
    ID = $(id -u)
    echo $ID
    if [ $ID -eq 0 ]
    then
        echo "user is root"
    else
        echo "user is not root"
    fi
}

INSTALL_APPLICATION(){
    IS_ROOT_USER
    echo "installing application $1"
    yum install $1 -y
    VALIDATE_INSTALLATION $1
}

VALIDATE_INSTALLATION(){
    if [ $? -eq 0 ]
    then
        echo "application $1 is installed"
    else
        echo "application $1 is not installed"
        exit 1
    fi
}

# check if user is root user to install the applciations or not
IS_ROOT_USER # this will fail in shell script because in shell you have to define the function before calling , calling should always at the end of file

# if user is root then install the applications 
# INSTALL_APPLICATION "mysql"

# validate application installation - i am calling this in install applciation method because it reduces code and when we install applciation validation of the installation is part of installation , if we dont validate , its the work half done


## final version i believe a on timestamp 9:18:15 5/20/2024

INSTALL_APPLICATION "mysql"
INSTALL_APPLICATION "firefox"
INSTALL_APPLICATION "nginx"
INSTALL_APPLICATION "chrome"
INSTALL_APPLICATION "firewall-d"
