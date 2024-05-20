#!/bin/bash

# IS_ROOT_USER # this will fail in shell script because in shell you have to define the function before calling , calling should always at the end of file



IS_ROOT_USER(){
    # ID = $id -u
    ID = $id -u
    if [ $ID -eq 0 ]
    then
        echo "user is root"
    else
        echo "user is not root"
    fi
}

INSTALL_APPLICATION(){
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
INSTALL_APPLICATION "mysql"

# validate application installation - i am calling this in install applciation method because it reduces code and when we install applciation validation of the installation is part of installation , if we dont validate , its the work half done
