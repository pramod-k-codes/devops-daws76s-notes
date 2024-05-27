#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
MONGDB_HOST=mongodb.daws76s.online

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script stareted executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILED $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

dnf module disable mysql -y &>> $LOGFILE

VALIDATE $? "Disable current MySQL version"

cp mysql.repo /etc/yum.repos.d/mysql.repo &>> $LOGFILE

VALIDATE $? "Copied MySQl repo"

dnf install mysql-community-server -y &>> $LOGFILE

VALIDATE $? "Installing MySQL Server"

systemctl enable mysqld &>> $LOGFILE 

VALIDATE $? "Enabling MySQL Server"

systemctl start mysqld &>> $LOGFILE

VALIDATE $? "Starting  MySQL Server" 

mysql_secure_installation --set-root-pass RoboShop@1 &>> $LOGFILE

VALIDATE $? "Setting  MySQL root password"



