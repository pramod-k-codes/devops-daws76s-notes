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
        # exit 0 # you give zero for success DONOT USE EXIT 0 , SCRIPT WILL TERMINATE HERE AND PASS , IT BECOMES FALSE POSITIVE
    else
        echo "user is not root user"
        exit 1 # you give other than 0 to fail
    fi
}
INSTALL_MYSQL(){
    echo "installing mysql"
    yum install mysql -y
    # echo "status of installation is $?"  IF YOU PUT ECHO HERE THEN ECHO IS SUCCESSFULLY EXECUTED THEN $? IS 0 ,its a bug in script
}
VALIDATE_INSTALLATION(){
    # echo "validating installation" IF YOU PUT ECHO HERE THEN ECHO IS SUCCESSFULLY EXECUTED THEN $? IS 0 ,its a bug in script
    if [ $? -eq 0 ]
    then
        echo "installation of package is successful"
    else
        echo "installation of package is not successful"
    exit 1
    fi
}

INSTALL_FIREFOX(){
    echo "installing firefox"
    yum install ffirefox -y
    # echo "status of installation is $?"  IF YOU PUT ECHO HERE THEN ECHO IS SUCCESSFULLY EXECUTED THEN $? IS 0 ,its a bug in script
}

IS_ROOT_USER
INSTALL_MYSQL
VALIDATE_INSTALLATION
INSTALL_FIREFOX
VALIDATE_INSTALLATION