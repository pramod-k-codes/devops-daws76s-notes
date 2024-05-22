#!bin/bash





ISROOTUSER(){
    if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
        exit
    else
        echo "Running as root"
    fi
}

#check if user is root or not
ISROOTUSER