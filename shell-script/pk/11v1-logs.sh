#!/bin/bash

# adding colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
NONE="\e[0m"


TIMESTAMP=$(date +%F%R%S)
LOGFILE=/tmp/$0-$TIMESTAMP.log

echo -e "Script started executing at $YELLOW $TIMESTAMP $NONE" &>> $LOGFILE

#function defenition needs to be on top in shell script
IS_ROOT_USER(){
    ID=$(id -u) 
    echo -e "$YELLOW checking if user is root $NONE"
    if [ $ID -eq 0 ]
    then
        echo -e $GREEN "user is root" $NONE
    else
        echo -e $RED "user is not root" $NONE
        exit 1;
    fi
}

INSTALL_APPLICATION(){
    IS_ROOT_USER
    echo -e "installing application $1"
    yum install $1 -y &>> $LOGFILE
    VALIDATE_INSTALLATION $? $1
}

VALIDATE_INSTALLATION(){
    if [ $1 -eq 0 ]
    then
        echo -e $GREEN "application $2 is installed" $NONE
    else
        echo -e $RED "application $2 is not installed" $NONE
    fi
}

IS_ROOT_USER # this will fail in shell script because in shell you have to define the function before calling , calling should always at the end of file
INSTALL_APPLICATION "mysql"
INSTALL_APPLICATION "firefox"
INSTALL_APPLICATION "chrome"
INSTALL_APPLICATION "firewall-d"
INSTALL_APPLICATION "nginx"



