# conditions 03:18
----------------

**recap till 03:18**

## what are coditional statements in shell script 07:38
-----------------------------------------------


```
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
```

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


### Installing MySQL and Git packages on a Linux system using Shell Script

example of comment in shell script
```bash

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
```

### Installing MySQL and Git packages on a Linux system using Shell Script
-------------------------------------------------------------

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

### diff bw ID = $(id -u) vs id -u
------------------

The commands `ID = id -u` and `ID=$(id -u)` in a shell script both involve using the `id` command to get the user ID (UID) of the current user, but they have different syntax and functionality. Let's break down each one.

### `id -u`
The command `id -u` prints the UID of the current user to the terminal.

### `ID = id -u`
This syntax is incorrect for assigning the result of `id -u` to a variable in a shell script. Instead, it would try to execute the command `ID` with an argument `= id -u`, which is not the intention.

### `ID=$(id -u)`
This syntax correctly captures the output of the `id -u` command and assigns it to the variable `ID`.

Let's understand the correct usage in more detail.

### Correct Way to Assign Command Output to a Variable

To assign the output of a command to a variable, you use either the `$(...)` syntax or backticks `` `...` ``. The `$(...)` syntax is preferred because it is more readable and can be nested.

Here’s what happens step-by-step:

1. **Command Execution**: The command inside `$(...)` is executed by the shell.
2. **Output Capture**: The standard output of the command is captured.
3. **Assignment**: The captured output is assigned to the variable.

For example:
```sh
ID=$(id -u)
```
This line:
- Executes the `id -u` command, which returns the UID of the current user.
- Captures the output of `id -u`.
- Assigns the captured output to the variable `ID`.

### Example in a Shell Script
Here’s a simple shell script demonstrating the correct usage:

```sh
#!/bin/bash

# Assign the UID to the variable ID
ID=$(id -u)

# Print the UID
echo "The user ID is: $ID"
```

### Common Mistakes
- **Spaces Around `=`**: In shell scripting, there should be no spaces around the `=` sign when assigning a value to a variable. For example, `ID=$(id -u)` is correct, but `ID = $(id -u)` is incorrect.
- **Using Quotes**: It's generally a good practice to quote variables when you use them, e.g., `echo "The user ID is: $ID"`.

### Practical Example
Let’s say you want to check if the current user is the root user (UID 0). You can use the captured UID in a conditional statement:

```sh
#!/bin/bash

# Get the UID of the current user
UID=$(id -u)

# Check if the user is root
if [ "$UID" -eq 0 ]; then
    echo "You are the root user."
else
    echo "You are not the root user."
fi
```

In summary, the main difference is that `ID = id -u` is incorrect due to improper syntax, while `ID=$(id -u)` is the correct way to capture the output of the `id -u` command and assign it to a variable in a shell script.

# 33:02 functions  

usually we have single task
---------------
1. 30 lines does accomplishes task A
2. 10 lines accomplishes tash A 
so it means that task A is efficiently accomplished in line 2

**less lines of code is preferred doing the same task**


## functions


function is a block of code that does something


**functions** --> code that is repeated again, you can keep in function and call it whenever you want....


## 34:50 function syntax

FUNCTION_NAME(){
	statements to run
}

VALIDATE(){
	statements to run
}

### calling the function 
just call function name then it will run


## fucntions code 36:17

```bash
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
```

This Bash script performs the following tasks:

1. It first assigns the user ID (`ID`) of the current user to the variable `ID` using the `id -u` command.

2. It defines a function `VALIDATE` which takes two arguments: the exit status code (`$1`) and a message (`$2`). This function checks if the exit status code is not equal to 0. If it's not 0, it prints an error message indicating failure and exits the script with exit status 1. Otherwise, it prints a success message.

3. It checks if the user ID (`$ID`) is not equal to 0, which typically indicates that the script is not being run with root privileges. If it's not 0, it prints an error message indicating that the script should be run with root access and exits with exit status 1. If the user ID is 0, it prints a message indicating that the user is root.

4. It attempts to install MySQL using the `yum install mysql -y` command.

5. It then calls the `VALIDATE` function with the exit status of the previous command (`$?`) and a message indicating the installation of MySQL.

6. It attempts to install Git using the `yum install git -y` command.

7. Again, it calls the `VALIDATE` function with the exit status of the previous command and a message indicating the installation of Git.

In summary, this script checks if it's being run with root privileges, installs MySQL and Git using `yum`, and validates the success of each installation using the `VALIDATE` function. If any installation fails, it prints an error message and exits with a non-zero exit status.

# 37:50 vid 4
## 40:15 parameterizing the functions

Shiva-S13 - vid 5 - timestamp 40:57

## logs 44:38 redirection 46:38

logging only happens when we log stuff

storing logs --> what happened yesterday


## Redirections 46:33

command > temp.log --> by default success output only stores here

**1 --> success
2 --> failure
& --> both success and failure**


In Linux, redirection is a feature that allows you to control where the output of a command goes and where the input of a command comes from. The symbols `1>`, `2>`, and `&>` are used to redirect standard output (stdout) and standard error (stderr). Here's a detailed explanation of each:

### 1. Standard Output Redirection (`1>`)

Standard output (`stdout`) is the default destination for output from a command. By default, this is the terminal screen. The `1>` symbol is used to redirect the standard output to a file or another destination.

#### Example:
```bash
ls -ltr 1> output.txt
```
This command lists the files in the current directory in long format, sorted by modification time in reverse order (`-ltr`). The `1>` symbol redirects the standard output (the list of files) to a file named `output.txt`. If `output.txt` already exists, it will be overwritten.

### 2. Standard Error Redirection (`2>`)

Standard error (`stderr`) is the default destination for error messages. By default, this is also the terminal screen. The `2>` symbol is used to redirect the standard error to a file or another destination.

#### Example:
```bash
ls -ltr non_existent_directory 2> error.txt
```
This command tries to list the contents of a non-existent directory. The `2>` symbol redirects the error message (because the directory does not exist) to a file named `error.txt`. If `error.txt` already exists, it will be overwritten.

### 3. Combined Redirection (`&>`)

The `&>` symbol is used to redirect both standard output and standard error to the same file or destination.

#### Example:
```bash
ls -ltr existing_directory non_existent_directory &> combined_output.txt
```
This command lists the contents of both an existing directory and a non-existent directory. The `&>` symbol redirects both the standard output (the list of files in the existing directory) and the standard error (the error message for the non-existent directory) to a file named `combined_output.txt`. If `combined_output.txt` already exists, it will be overwritten.

### Summary of Symbols:

- `1>`: Redirects standard output.
- `2>`: Redirects standard error.
- `&>`: Redirects both standard output and standard error.

### Practical Example:

Here is a combined example demonstrating all these redirections:

```bash
ls -ltr existing_directory 1> output.txt 2> error.txt
```
In this command:
- Standard output is redirected to `output.txt`.
- Standard error is redirected to `error.txt`.

Alternatively, you can combine both outputs into one file:

```bash
ls -ltr existing_directory &> combined_output.txt
```
In this command:
- Both standard output and standard error are redirected to `combined_output.txt`.

Understanding these redirection techniques allows you to better control and manage the output and error messages generated by your commands in a Linux environment.


`>` for redirection of output and replace previous output

`>>` appends to existing file at the end



## special symbols, How to get script name

script-name-<date>.log

Sure, here are the explanations in one line each:

- `$?`: Exit status of the last executed command.
- `$0`: Name of the script being executed.
- `$1`: First argument passed to the script.
- `$2`: Second argument passed to the script.
- `$N`: Nth argument passed to the script.
- `$@`: All arguments passed to the script, each as a separate word.
- `$#`: Number of arguments passed to the script.
  

practice out side of repo dir in server it might cause conflicts in git directory while pulling


## date formatting 59:50

`date +%F`



## 1:2:50 11-logs.sh

timestamp inclusion


## difference between echo "$DATE"` and `echo $DATE`

The difference between `echo "$DATE"` and `echo $DATE` lies in how they handle the value of the `DATE` variable, especially when it contains spaces or special characters.

- `echo "$DATE"`: Preserves the literal value of `DATE`, including spaces and special characters. This means if `DATE` contains multiple words or special symbols, they will be printed exactly as they are.
  
  ```bash
  DATE="May 21 2024"
  echo "$DATE"
  # Output: May 21 2024
  ```

- `echo $DATE`: Splits the value of `DATE` based on whitespace and can cause word splitting or unexpected results if `DATE` contains spaces or special characters.
  
  ```bash
  DATE="May 21 2024"
  echo $DATE
  # Output: May 21 2024
  ```

While the output might look the same in this simple example, the difference becomes evident when `DATE` contains multiple spaces or special characters:

```bash
DATE="May 21  2024"
echo "$DATE"
# Output: May 21  2024

echo $DATE
# Output: May 21 2024
```

In the second example, the extra space between "21" and "2024" is collapsed when using `echo $DATE` due to word splitting, whereas `echo "$DATE"` preserves the exact formatting.

## colors in terminal and shell script 1:06:25

R="\e[31m"
G="\e[32m"
N="\e[0m"

The `echo -e` command in Linux is used to enable interpretation of backslash escapes. This allows you to use special escape sequences within the string that `echo` prints. Here are some commonly used escape sequences:

- `\n`: New line
- `\t`: Tab
- `\\`: Backslash
- `\b`: Backspace

### Example Usage:

```bash
echo -e "First line\nSecond line"
# Output:
# First line
# Second line

echo -e "Column1\tColumn2\tColumn3"
# Output:
# Column1 Column2 Column3

echo -e "This is a backslash: \\"
# Output:
# This is a backslash: \

echo -e "Hello\bWorld"
# Output:
# HellWorld
```

In each case, the `-e` option tells `echo` to interpret the escape sequences and produce the formatted output accordingly. Without `-e`, the backslashes would be treated as literal characters, and the special formatting would not occur.


## loops and how to use them 1:14:00

for(int i=0;i<100;i++){
	print i;	
}
**12loops.sh 1:17:00**


 
### exit 0 and exit status

if you give exit 0 script will terminate at point and will be marked as success 

for the same reason you negative valitaion is preferred like here

![loops and functions](image/13-10-functions.png)

```bash
When you use `exit 0` within a loop in a shell script, it has a specific meaning related to the script's execution. Let's break it down:

1. **Exit Codes in Bash**:
   - Bash scripts can exit with different **exit codes** to indicate success or failure.
   - The standard convention is as follows:
     - **Zero (0)**: Indicates success.
     - **Non-zero (1, 2, 3, etc.)**: Represents failure or specific error conditions¹.
   - These exit codes help other programs understand whether your script executed successfully or encountered issues.

2. **Using `exit 0`**:
   - When you include `exit 0` in your script, you explicitly set the exit code to zero.
   - This means that the script is exiting successfully, regardless of any other conditions or errors.
   - For example, consider the following script snippet:
     ```bash
     #!/bin/bash
     echo "Exit command test"
     exit 0
     ```
     In this case, the script will always exit with a success code (0), regardless of any other logic or loops¹.

3. **Handling Errors and Exit Codes**:
   - Proper error handling is crucial for robust scripts.
   - Instead of hoping nothing goes wrong, anticipate possible failures and decide how your program should react.
   - Use non-zero exit codes creatively to convey specific reasons for script failure (e.g., 1 for incorrect arguments, 2 for missing files, etc.)¹.

Remember, consistency and clear error handling make your scripts more reliable and user-friendly! 😊🚀

Source: Conversation with Bing, 5/18/2024
(1) Exit a Bash Script: exit 0 and exit 1 Explained - Codefather. https://codefather.tech/blog/exit-bash-script/.
(2) Bash break: How to Exit From a Loop - phoenixNAP. https://phoenixnap.com/kb/bash-break.
(3) What is meaning of 'exit 0' in shell script? - Stack Overflow. https://stackoverflow.com/questions/37788172/what-is-meaning-of-exit-0-in-shell-script.
(4) shell script - Need the exit code of condition function when a Bash .... https://unix.stackexchange.com/questions/676733/need-the-exit-code-of-condition-function-when-a-bash-while-loop-terminates.
```


## EXIT status and exit codes
---------------
previous command success or not

`$?` --> if success, it has 0
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

## Error Handling
---------------
1. stop, clear the error and proceed
2. dont worry about error, proceed

shell script wont stop if it faces error,

it is our responsibility to check and proceed


## end of class questions

jagadish
vishnu
sowmit
smoothini saga
sukumar g
afsana
TUKARAM
AMULYA debugging
narasimha rao