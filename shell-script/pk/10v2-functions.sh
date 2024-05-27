#!/bin/bash

# IS_ROOT_USER # this will fail in shell script because in shell you have to define the function before calling , calling should always at the end of file


# ID=$(id -u) #should not have spaces as like this ID = $(id -u)

IS_ROOT_USER(){
    # ID = $id -u -threre are 2 issues if you use id here , ID is not defined and also correct command is $(id -u)
    ID=$(id -u) #should not have spaces as like this ID = $(id -u)

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
        # exit 1 if you use this the script will stop when one installation fails , you should log and continue
        # Log the error and continue with the next installation
        echo "Error: Unable to install $2" >> install_errors.log
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
INSTALL_APPLICATION "chrome"
INSTALL_APPLICATION "firewall-d"
INSTALL_APPLICATION "nginx"

