# !#/bin/bash -- idi kadu ra ayya she bang rayali
#!/bin/bash
# read and determine if user is root user

# if root user is true then install package

# check if installation is successful , display log irrespective of message

echo "checking if user is root user"
echo $EUID
IS_ROOT_USER(){
    if [ $EUID -eq 0 ]
    then
        echo "user is root user"
        exit 0 # you give zero for success
    else
        echo "user is not root user"
        exit 1 # you give other than 0 to fail
    fi
}
INSTALL_MSSQL(){
    echo "installing mssql"
    yum install mssql -y
    echo "status of installation is $?"
}
VALIDATE_INSTALLATION(){
    echo "validating installation"
    if [ $? -eq 0 ]
    then
        echo "installation of package is successful"
    else
        echo "installation of package is not successful"
    exit 1
    fi
}

IS_ROOT_USER
INSTALL_MSSQL
VALIDATE_INSTALLATION
# INSTALL_FIREFOX
# VALIDATE_INSTALLATION