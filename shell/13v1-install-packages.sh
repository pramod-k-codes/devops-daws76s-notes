#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

ECHO_PROCESS() {
    echo -e $1 $2 $N $3
}

ISROOTUSER() {
    if [ "$EUID" -ne 0 ]; then
        ECHO_PROCESS $R"Please run as root"
        exit 1
    else
        ECHO_PROCESS $G "Running as root"
    fi
}

IS_PACKAGE_INSTALLED() {
    echo "checking if package is installed"
    yum list installed $1 >/dev/null 2>&1
    # yum info $1
    if [ $? -eq 0 ]; then
        ECHO_PROCESS $Y "$1 is installed , skipping"
        return 1
    else
        ECHO_PROCESS $G "$1 is not installed , proceeding with installing"
        yum install $1 -y
        if [ $? -eq 0 ]; then
            ECHO_PROCESS $G "$1 is installed successfully"
        else
            ECHO_PROCESS $R "$1 installation failed"
            exit 1
        fi
        return 0
    fi
}

IS_VALID_PACKAGE() {
    echo "checking if package is valid"
    # yum list available $1 # this checks and lists package detail from repositories when the package is not installed so not very instrumental
    yum info $1 >/dev/null 2>&1
    if [ $? -eq 0 ]; then #    if [$# -gt 0] you need spaces
        ECHO_PROCESS $G "$1 is valid"
        IS_PACKAGE_INSTALLED $1
        return 0
    else
        ECHO_PROCESS $R "$1 is invalid"
        return 1
    fi
}

INSTALL_PACKAGES() {
    if [ $# -gt 0 ]; then #    if [$# -gt 0] you need spaces
        ECHO_PROCESS $G "Number of packages is $#, proceeding installation"
        # Loop through each package
        for current_package in $@; do
            ECHO_PROCESS $G "Installing package no $current_package"
            IS_VALID_PACKAGE $current_package
        done
    else
        ECHO_PROCESS $R "Number of packages is $# - No packages to install"
        exit 1
    fi
}

ISROOTUSER
INSTALL_PACKAGES "$@"
