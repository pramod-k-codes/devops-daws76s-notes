#!bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

# Process text for formatting
ECHO_PROCESS 

ECHO_PROCESS(){
    echo -e $1 $2 $N
}

ISROOTUSER(){
    if [ "$EUID" -ne 0 ]
    then echo $R"Please run as root"$N
        exit
    else
        echo "Running as root"
    fi
}

#check if user is root or not
ISROOTUSER