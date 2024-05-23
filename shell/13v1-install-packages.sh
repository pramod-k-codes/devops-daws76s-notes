#!bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"


ECHO_PROCESS(){
    echo -e $1 $2 $N $3
}

ISROOTUSER(){
    if [ "$EUID" -ne 0 ]
    then ECHO_PROCESS $R"Please run as root"
        exit
    else
        ECHO_PROCESS $G "Running as root"
    fi
}

IS_PACKAGE_INSTALLED(){
    echo "checking if package is installed"
    if yum list installed $1 > /dev/null 2>&1
    then
        ECHO_PROCESS $R "$1 is already installed not installing again"
    exit 0
    else
        ECHO_PROCESS $G "$1 is not installed , proceeding with installing"
    exit 1
    fi
}

INSTALL_APPLICATION(){
    ECHO_PROCESS $G "Installing application" $1
    yum install $1 -y
    if [ $? -eq 0 ]
    then
        ECHO_PROCESS $G "$1 installed"
    else
        ECHO_PROCESS $R "$1 installation failed"
        exit 1
    fi
}
INSTALL_PACKAGES(){
    echo "Installing package no $#"
    if [ $# -gt 0 ] #    if [$# -gt 0] you need spaces
    then ECHO_PROCESS $G "Number of packages is $#, proceeding installation"
        for current_package in $@
        do
        IS_PACKAGE_INSTALLED $current_package 
            if [ $? -eq 0 ]
            then 
                INSTALL_APPLICATION $current_package
            else
                ECHO_PROCESS $R "$current_package installation failed"
                # exit 1
            fi
        done
    else
        ECHO_PROCESS $R "No packages to install"
        exit 1
    fi
}

INSTALL_PACKAGES nginx