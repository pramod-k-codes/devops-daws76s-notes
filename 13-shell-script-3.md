# conditions 03:18
----------------

**recap till 03:18**

## what are coditional statements in shell script 07:38
-----------------------------------------------


if(expression){
	statement if expression is true
}
else{
	statement if expression is false
}

if(expression){
	statement if expression is true
}
else if(expression){
	statement if expression is true
}
else if(expression){
}
else{
	statement if expression is false
}

if(today != "sunday"){
	print "goto school"
}
else{
	print "Happy Holiday"
}

20
if 20 is greater than 100 then print, given no is greater than 20
otherwise print less than 100

## shell script operators arihtmetic

$NUMBER > 100

$NUMBER -gt 100

$NUMBER -lt 100

$NUMBER -ge 100

$NUMBER -le 100

## logic to install a program in shell 13:00







Install MySQL through shell script
------------------------------

steps:
-------------
1. check user is root or not
2. if root --> if id is not equal to 0, then it is not root user
	 proceed
   if not root
	 stop and say run with root access
3. now install mysql
4. check installed properly.
5. if success
	 then good
   not success
      show what is the error


### installing mysql in shell script
----------------------------------
#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installing MySQL is failed"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installing GIT is failed"
    exit 1
else
    echo "Installing GIT is SUCCESS"
fi


This script is a Bash script (denoted by `#!/bin/bash` at the beginning) designed to automate the installation of MySQL and Git packages on a Linux system. Let's break it down step by step:

1. **Getting User ID**: 
```bash
ID=$(id -u)
```
This line uses the `id` command with the `-u` option to get the user ID of the user running the script and stores it in the variable `ID`.

2. **Checking Root Access**: 
```bash
if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi
```
This block checks whether the user running the script has root (superuser) access. If the user ID is not 0 (which typically corresponds to the root user), it prints an error message and exits the script with exit code 1. Otherwise, it prints a message indicating that the user is root.

3. **Installing MySQL**: 
```bash
yum install mysql -y
```
This command uses the `yum` package manager to install MySQL without prompting for user confirmation (`-y` flag).

4. **Checking MySQL Installation Status**: 
```bash
if [ $? -ne 0 ]
then
    echo "ERROR:: Installing MySQL is failed"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi
```
After the installation, `$?` holds the exit status of the last command executed (`yum install mysql -y`). If the exit status is non-zero, it means an error occurred during the installation. In that case, it prints an error message and exits with code 1. Otherwise, it prints a success message.

5. **Installing Git**: 
```bash
yum install git -y
```
Similar to the MySQL installation, this command installs Git without user confirmation.

6. **Checking Git Installation Status**: 
```bash
if [ $? -ne 0 ]
then
    echo "ERROR:: Installing GIT is failed"
    exit 1
else
    echo "Installing GIT is SUCCESS"
fi
```
This block checks the exit status of the Git installation command (`yum install git -y`) and prints a success or error message accordingly.

In summary, the script checks for root access, installs MySQL and Git, and provides feedback on the success or failure of each installation step.









------------------------

100 statements
10th line --> error

1. stop, clear the error and proceed
2. dont worry about error, proceed

shell script wont stop if it faces error,

it is our responsibility to check and proceed



EXIT status
---------------
previous command success or not

$? --> if success, it has 0
if failure, not zero


different exit status are listed below

In Linux and Unix-like operating systems, the exit status, also known as the return code, is a value returned by a command or a program to the parent process after it has finished executing. This exit status typically indicates whether the command or program completed successfully or encountered an error.

Here are some common exit status codes and their meanings:

1. **0**: Success - Indicates that the command or program completed successfully without encountering any errors.
  
2. **1**: General error - This exit status code is often used to indicate that the command or program encountered some unspecified error.
  
3. **2**: Misuse of shell builtins - Indicates that there was a misuse of shell built-in commands.
  
4. **126**: Permission problem or command is not executable - Indicates that the command or script does not have the appropriate permissions to execute or that it is not executable.
  
5. **127**: Command not found - Indicates that the command was not found or could not be executed.
  
6. **128+n**: Fatal error signal "n" - Indicates that the command or program terminated due to receiving a fatal signal. The value of "n" is typically added to 128 to determine the exit status code.
  
7. **130**: Terminated by Ctrl+C - Indicates that the command or program was terminated by the user pressing Ctrl+C.
  
8. **255**: Exit status out of range - Indicates that the exit status code is out of the valid range (0-255).

These are some of the commonly used exit status codes, but there can be variations depending on the specific command or program being executed. It's important to refer to the documentation of each command or program to understand its specific exit status codes and their meanings.




usually we have single task
---------------
1. 30 lines
2. 10 lines

**less lines of code is preferred doing the same task**


## functions
**functions** --> code that is repeated again, you can keep in function and call it whenever you want....
manager --> developer


FUNCTION_NAME(){
	statements to run
}

VALIDATE(){
	statements to run
}

FUNCTION_NAME --> calling name

#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... FAILED"
        exit 1
    else
        echo "$2 ... SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # you can give other than 0
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

yum install mysql -y

VALIDATE $? "Installing MySQL"

yum install git -y

VALIDATE $? "Installing GIT"

This Bash script performs the following tasks:

1. It first assigns the user ID (`ID`) of the current user to the variable `ID` using the `id -u` command.

2. It defines a function `VALIDATE` which takes two arguments: the exit status code (`$1`) and a message (`$2`). This function checks if the exit status code is not equal to 0. If it's not 0, it prints an error message indicating failure and exits the script with exit status 1. Otherwise, it prints a success message.

3. It checks if the user ID (`$ID`) is not equal to 0, which typically indicates that the script is not being run with root privileges. If it's not 0, it prints an error message indicating that the script should be run with root access and exits with exit status 1. If the user ID is 0, it prints a message indicating that the user is root.

4. It attempts to install MySQL using the `yum install mysql -y` command.

5. It then calls the `VALIDATE` function with the exit status of the previous command (`$?`) and a message indicating the installation of MySQL.

6. It attempts to install Git using the `yum install git -y` command.

7. Again, it calls the `VALIDATE` function with the exit status of the previous command and a message indicating the installation of Git.

In summary, this script checks if it's being run with root privileges, installs MySQL and Git using `yum`, and validates the success of each installation using the `VALIDATE` function. If any installation fails, it prints an error message and exits with a non-zero exit status.




## logging
logging only happens when we log stuff

storing logs --> what happened yesterday

> --> redirection

Redirections 46:33

---------------

`>` --> redirection of output


to st
command > temp.log --> by default success output only stores here

1 --> success
2 --> failure
& --> both success and failure

> --> replace previous output

>> 

script-name-<date>.log

$? --> exit status of previous command
$0 --> you will get script name
$1
$2
$N
$@
$#


RED -- \e[31m
GREEN -- \e[32m
YELLOW -- \e[33m
normal -- \e[0m

echo -e "Hello Iam learning \e[31m Shell script"

loops
-----------------
1 100

eho 1
echo 2
echo 3
echo 4

for(int i=0;i<100;i++){
	print i;	
}

<h1>fkhdfkjdffjdf;djfl</h1> fjdfjdf;lf



LOGFILE=/tmp/something.log

ls -ltr &>> $LOGFILE