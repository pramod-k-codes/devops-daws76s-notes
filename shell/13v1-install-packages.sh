#!bin/bash

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

IS_VALID_PACKAGE() {
    echo "checking if package is valid"
    if yum list available "$1" >/dev/null 2>&1; then
        ECHO_PROCESS $G "$1 is valid"
        return 0
    else
        ECHO_PROCESS $R "$1 is invalid"
        return 1
    fi
}

IS_PACKAGE_INSTALLED() {
    echo "checking if package is installed"
    yum list installed $1 >/dev/null 2>&1
    # yum info $1
    if [ $? -eq 0 ]; then
        ECHO_PROCESS $Y "$1 is installed , skipping"
        return 0
    else
        ECHO_PROCESS $G "$1 is not installed , proceeding with installing"
        return 1
    fi
}

PERFORM_INSTALLATION() {
    # Check if the package is available in the repositories
    IS_VALID_PACKAGE $1
    if [$? -ne 0 ]; then
        # if $? value is zero then it means that the package is available so we don't need to do anything in this step
        # but when package is unavailable break loop and getout so exit 1
        ECHO_PROCESS $R "Package '$1' is not available in the repositories, enter correct package name."
        exit 1
    fi

    IS_PACKAGE_INSTALLED $1
    if [ $? -ne 0 ]; then
        ECHO_PROCESS $G "Installing application" $1
        yum install $1 -y
        if [ $? -eq 0 ]; then
            ECHO_PROCESS $G "$1 installed"
        else
            ECHO_PROCESS $R "$1 installation failed"
            exit 1
        fi
    else
        ECHO_PROCESS $R "Package '$1' is installed proceeding with next installations."
    fi
}

INSTALL_PACKAGES() {
    ECHO_PROCESS $G "Installing package no $#"
    if [ $# -gt 0 ]; then #    if [$# -gt 0] you need spaces
        ECHO_PROCESS $G "Number of packages is $#, proceeding installation"

        # Loop through each package
        for current_package in $@; do

            PERFORM_INSTALLATION $current_package
            IS_PACKAGE_INSTALLED $current_package
        done
    else
        ECHO_PROCESS $R "No packages to install"
        exit 1
    fi
}

ISROOTUSER
INSTALL_PACKAGES "$@"
# followng fixes needed
#  tries to install installed packages only install packages which are not installed
# print if package name is wrong
