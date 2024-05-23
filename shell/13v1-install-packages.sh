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
INSTALL_PACKAGES(){
    echo "Installing packages $#"
    if [$# -gt 0]
    then ECHO_PROCESS $G "Number of packages is $#, proceeding installation"
    else
    ECHO_PROCESS $R "No packages to install"
    exit 1
    fi
}
not started on 23052023 sadly




 