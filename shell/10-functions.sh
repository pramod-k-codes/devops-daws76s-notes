# !#/bin/bash -- idi kadu ra ayya she bang rayali
#!/bin/bash
# read and determine if user is root user

# if root user is true then install package

# check if installation is successful , display log irrespective of message


IS_ROOT_USER(){
    if [ $EUID -eq 0 ]
    then
        echo "user is root user"
    else
        echo "user is not root user"
    fi
}

IS_ROOT_USER
