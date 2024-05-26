#!bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
G="\e[33m"
N="\e[0m"

ECHO_PROCESS() {
    echo -e $1 $2 $N $3
}

ISROOTUSER() {
    if [ "$EUID" -ne 0 ]; then
        ECHO_PROCESS $R"Please run as root"
        exit
    else
        ECHO_PROCESS $G "Running as root"
    fi
}

IS_VALID_PACKAGE() {
    echo "checking if package is valid"
    if yum list available "$current_package" >/dev/null 2>&1; then
        ECHO_PROCESS $G "$current_package is valid"
        return 0
    else
        ECHO_PROCESS $R "$current_package is invalid"
        return 1
    fi
}

IS_PACKAGE_INSTALLED() {
    echo "checking if package is installed"
    # if yum list installed $1 >/dev/null 2>&1; then
    yum info $1
    if [ $? -eq 0 ]; then
        ECHO_PROCESS $R "$1 is installed , skipping"
        return 0
    else
        ECHO_PROCESS $G "$1 is not installed , proceeding with installing"
        return 1
    fi
}

PERFORM_INSTALLATION() {
    # Check if the package is available in the repositories
    if yum list available "$package_name" >/dev/null 2>&1; then
        ECHO_PROCESS $G "Package '$package_name' is valid."
        ECHO_PROCESS $G "Installing application" $1
        yum install $1 -y
        if [ $? -eq 0 ]; then
            ECHO_PROCESS $G "$1 installed"
        else
            ECHO_PROCESS $R "$1 installation failed"
            exit 1
        fi
    else
        ECHO_PROCESS $R "Package '$package_name' is not available in the repositories enter correct package name."
        exit 1
    fi
}

INSTALL_PACKAGES() {
    ECHO_PROCESS $G "Installing package no $#"
    if [ $# -gt 0 ]; then #    if [$# -gt 0] you need spaces
        ECHO_PROCESS $G "Number of packages is $#, proceeding installation"

        # Loop through each package
        for current_package in $@; do

            IS_VALID_PACKAGE $current_package
            # check if package is already installed
            IS_PACKAGE_INSTALLED $current_package
            # if package is not installed install it
            if [ $? -ne 0 ]; then # if 0 then package is installed already so check for non zero
                PERFORM_INSTALLATION $current_package
                # check if installation failed
                IS_PACKAGE_INSTALLED $current_package
                # if [ $? -ne 0 ]; then
                #     ECHO_PROCESS $R "$current_package installation failed"
                # fi
            else
                ECHO_PROCESS $R "$current_package is not installed"
            fi
        done
    else
        ECHO_PROCESS $R "No packages to install"
        exit 1
    fi
}

INSTALL_PACKAGES
# followng fixes needed
#  tries to install installed packages only install packages which are not installed
# print if package name is wrong
