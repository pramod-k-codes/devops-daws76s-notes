# shell script session 14 Loops in shell

Shiva-S14 - vid 1 - timestamp 04:15

## parameterizing the installations 05:05

using loops install any no of packages
--------------------------------------

sh 13-install-packages.sh git mysql gcc postfix net-tools

$# --> no of args

$@ --> all args

Steps to install packages , psudo code

1. check root user or not
2. if root user
  check package is already installed or not
   if installed skip it and tell user, already installed
   if not installe, install it
   validate it
 if not root user
  throw the error

### 13:installpackages .sh 8:47

loops explanation 11:47

To check if a package is installed using `yum` in a script, you can use an `if` condition to evaluate the output of the `yum list installed` command. Here’s a basic example of how you can do this in a bash script:

```bash
#!/bin/bash

PACKAGE_NAME="your-package-name"

if yum list installed "$PACKAGE_NAME" &> /dev/null; then
    echo "$PACKAGE_NAME is installed."
else
    echo "$PACKAGE_NAME is not installed."
fi
```

### Explanation

1. **`PACKAGE_NAME="your-package-name"`**: Assign the package name to a variable.
2. **`yum list installed "$PACKAGE_NAME" &> /dev/null`**: This command checks if the package is installed. The `&> /dev/null` part redirects both stdout and stderr to `/dev/null`, effectively silencing the command’s output.
3. **`if` condition**: The `if` statement checks the exit status of the `yum list installed` command. If the package is installed, the command exits with status `0`, which means the condition evaluates to true.
4. **`then`**: If the package is installed, print a message saying so.
5. **`else`**: If the package is not installed, print a message saying so.

You can save this script to a file, make it executable, and run it. For example:

```bash
chmod +x check_package.sh
./check_package.sh
```

Replace `your-package-name` with the actual package name you want to check.

## installing packages through shell script . this took a week for me to script 😊👌(❁´◡`❁)😎

![Celebre the hardwrok](image/dance.png)

```bash

#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# This function is used to print messages with color and timestamp.
# Parameters:
#   $1: Color code for the message.
#   $2: Message to be printed.
#   $3: Additional message to be printed.
# Return:
#   None
ECHO_PROCESS() {
    echo -e $1 $2 $N $3 # Print the message with color and timestamp
}

# This function checks if the script is being run as root.
# If not, it prints an error message and exits with a status code of 1.
# If it is being run as root, it prints a success message.
# Parameters: None
# Return: None
ISROOTUSER() {
    if [ "$EUID" -ne 0 ]; then              # Check if the effective user ID is not 0 (root)
        ECHO_PROCESS $R"Please run as root" # Print error message
        exit 1                              # Exit with status code 1
    else
        ECHO_PROCESS $G "Running as root" # Print success message
    fi
}

# This function checks if a package is installed.
# If the package is installed, it prints a message and returns 1.
# If the package is not installed, it prints a message, installs the package, and returns 0.
# If the installation fails, it prints an error message and exits with a status code of 1.
# Parameters:
#   $1: The name of the package to be checked and installed.
# Return:
#   1 if the package is installed, 0 if the package is not installed and successfully installed.
IS_PACKAGE_INSTALLED() {
    echo "checking if package is installed"
    # yum list available $1 # this checks and lists package detail from repositories when the package is not installed so not very instrumental

    yum list installed | grep $1 #this checks for installed package
    if [ $? -eq 0 ]; then        # If the package is installed
        ECHO_PROCESS $Y "$1 is installed, skipping"
        return 1
    else # If the package is not installed
        ECHO_PROCESS $G "$1 is not installed, proceeding with installing"
        yum install $1 -y     # Install the package
        if [ $? -eq 0 ]; then # If the installation is successful
            ECHO_PROCESS $G "$1 is installed successfully"
        else # If the installation fails
            ECHO_PROCESS $R "$1 installation failed"
            exit 1 # Exit with status code 1
        fi
        return 0 # Return 0 to indicate that the package is not installed and successfully installed
    fi
}

# This function checks if a given package is valid.
# It uses the 'yum info' command to check if the package is available in the repositories.
# Parameters:
#   $1: The name of the package to be checked.
# Return:
#   0 if the package is valid and the IS_PACKAGE_INSTALLED function is called.
#   1 if the package is invalid.
IS_VALID_PACKAGE() {
    echo "checking if package is valid"
    # yum list available $1 # this checks and lists package detail from repositories when the package is not installed so not very instrumental
    yum info $1 >/dev/null 2>&1 #this checks if package name is valid to install
    if [ $? -eq 0 ]; then #    if [$# -gt 0] you need spaces
        ECHO_PROCESS $G "$1 is valid"
        IS_PACKAGE_INSTALLED $1
        return 0
    else
        ECHO_PROCESS $R "$1 is invalid"
        return 1
    fi
}

# This function is responsible for installing packages passed as arguments.
# It checks if the number of packages is greater than 0. If not, it prints an error message and exits.
# If packages are provided, it loops through each package, prints a message indicating the package number and name,
# and calls the IS_VALID_PACKAGE function to check if the package is valid and install it.
# Parameters:
#   $@: A list of packages to be installed.
# Return:
#   None
INSTALL_PACKAGES() {
    PACKAGE_INDEX=1                                                         # Initialize package index assignment should not have spaces
    if [ $# -gt 0 ]; then                                                   # Check if the number of arguments is greater than 0
        ECHO_PROCESS $G "Number of packages is $#, proceeding installation" # Print a message indicating the number of packages and the installation process
        # Loop through each package
        for CURRENT_PACKAGE in $@; do
            ECHO_PROCESS $G "Installing package no $PACKAGE_INDEX - $CURRENT_PACKAGE" # Print a message indicating the package number and name
            IS_VALID_PACKAGE $CURRENT_PACKAGE                                         # Call the IS_VALID_PACKAGE function to check if the package is valid and install it
            PACKAGE_INDEX=$((PACKAGE_INDEX + 1))                                      # Increment the package index
        done
    else
        ECHO_PROCESS $R "Number of packages is $# - No packages to install" # Print an error message if no packages are provided
        exit 1                                                              # Exit with a status code of 1
    fi
    ECHO_PROCESS $G "Installation of packages is complete" # Print a message indicating the installation is complete
}

ISROOTUSER
INSTALL_PACKAGES "$@"



```

check the script by
`sh -x 13v1-install-packages.sh ss j iw net-tools uy`

Shiva-S14 - vid 3 - timestamp 27:20

Creation of DB (mongo db ) using shell script manually , we can copy and paste the repo details in the instance using the vim or similar editor

But in shell script the apporach is
> create a file which will contain the data you want to upload to a specific loation
> export it using `cp` command , because editing is not possible with vim in shell and also makes things complicated
>

When user is manually creating the DB

Shiva-S14 - vid 3 - timestamp 33:00 SED

Replacing text in existing file is not possible with vim in shell, so we need to use `sed` command to replace the text in the file.

## SED Editor 33:00

In Linux, `sed` (short for **Stream Editor**) is a powerful command-line utility used for parsing and transforming text. It reads input text line by line, performs specified operations on each line, and outputs the modified text. Common operations include searching, replacing, inserting, and deleting text. Here are some typical uses of `sed`:

1. **Substitution**: Replace occurrences of a pattern with a replacement.

   ```sh
   sed 's/old/new/' file.txt
   ```

   This command replaces the first occurrence of "old" with "new" in each line of `file.txt`.

2. **Global Substitution**: Replace all occurrences of a pattern with a replacement.

   ```sh
   sed 's/old/new/g' file.txt
   ```

   This command replaces all occurrences of "old" with "new" in each line.

3. **In-place Editing**: Modify the original file directly.

   ```sh
   sed -i 's/old/new/g' file.txt
   ```

   This command performs a global substitution and saves the changes directly to `file.txt`.

4. **Delete Lines**: Remove lines matching a pattern.

   ```sh
   sed '/pattern/d' file.txt
   ```

   This command deletes lines containing "pattern" from `file.txt`.

5. **Print Lines**: Print specific lines that match a pattern.

   ```sh
   sed -n '/pattern/p' file.txt
   ```

   This command prints only the lines that contain "pattern".

6. **Insert or Append Text**: Add text before or after a pattern.

   ```sh
   sed '/pattern/i\new line' file.txt
   sed '/pattern/a\new line' file.txt
   ```

   The first command inserts "new line" before lines containing "pattern", and the second inserts it after.

7. **Extracting Lines by Number**:

   ```sh
   sed -n '5,10p' file.txt
   ```

   This command prints lines 5 through 10 from `file.txt`.

`sed` is a versatile tool, especially useful for scripting and automation, as it can handle large files and perform complex text manipulations efficiently.

to pracitce make a copy of /etc/passwd file to current dir by

`cp /etc/passwd passwd`

this doesnt open editor and directly opens the editor

`sed -e '1 a I am learning Shell script' <file-name>`

The `sed` command you provided is used to append a line of text after a specified line in a file. Let's break down the command:

```sh
sed -e '1 a I am learning Shell script' <file-name>
```

Here is a detailed explanation of each part of the command:

1. **`sed`**: This is the command itself, invoking the stream editor.
2. **`-e`**: This option indicates that the following string is a script to be executed by `sed`. You can include multiple `-e` options to execute multiple scripts in sequence.
3. **`'1 a I am learning Shell script'`**: This is the `sed` script. It has three parts:
   - **`1`**: This specifies the line number after which the text will be appended. In this case, it's line 1.
   - **`a`**: This stands for "append". It tells `sed` to add the following text after the specified line.
   - **`I am learning Shell script`**: This is the text to be appended.
4. **`<file-name>`**: This is the input file. `sed` will read from this file and process its contents according to the script provided.

### What the Command Does

- The command reads the contents of `<file-name>`.
- After the first line (line 1), it appends the text "I am learning Shell script".
- The output will include the original file contents with the specified text added after the first line.

### Example

Suppose `<file-name>` contains the following text:

```
Line 1
Line 2
Line 3
```

Running the command:

```sh
sed -e '1 a I am learning Shell script' <file-name>
```

The output will be:

```
Line 1
I am learning Shell script
Line 2
Line 3
```

In summary, this `sed` command inserts the specified text "I am learning Shell script" immediately after the first line of the input file.

sed is temparory editor

if you want the change to be permananetted, you can use i instead of e

## i VS e 37:00

The `sed` commands you provided both append a line of text after the first line of a file, but there is a key difference between them in terms of how they affect the file. Here's a detailed explanation of each command:

### `sed -i '1 a I am learning Shell script' <file-name>`

1. **`sed`**: This is the stream editor command.
2. **`-i`**: This option stands for "in-place" editing. It modifies the file directly, saving the changes to the original file.
3. **`'1 a I am learning Shell script'`**: This is the `sed` script:
   - **`1`**: Specifies the line number after which to append the text. Here, it's line 1.
   - **`a`**: Stands for "append".
   - **`I am learning Shell script`**: The text to be appended.
4. **`<file-name>`**: The input file to be modified.

### What it does

- This command reads `<file-name>`.
- It appends "I am learning Shell script" after the first line.
- The file `<file-name>` is modified in place, meaning the changes are saved directly to the file.

### Example

Suppose `<file-name>` contains:

```
Line 1
Line 2
Line 3
```

After running:

```sh
sed -i '1 a I am learning Shell script' <file-name>
```

The content of `<file-name>` will be:

```
Line 1
I am learning Shell script
Line 2
Line 3
```

### `sed -e '1 a I am learning Shell script' <file-name>`

1. **`sed`**: The stream editor command.
2. **`-e`**: Indicates that the following string is a script to be executed.
3. **`'1 a I am learning Shell script'`**: This is the `sed` script:
   - **`1`**: Specifies the line number after which to append the text.
   - **`a`**: Stands for "append".
   - **`I am learning Shell script`**: The text to be appended.
4. **`<file-name>`**: The input file to be processed.

### What it does

- This command reads `<file-name>`.
- It appends "I am learning Shell script" after the first line.
- The changes are not saved to `<file-name>`; instead, the modified content is sent to the standard output (typically the terminal).

### Example

Suppose `<file-name>` contains:

```
Line 1
Line 2
Line 3
```

After running:

```sh
sed -e '1 a I am learning Shell script' <file-name>
```

The output will be:

```
Line 1
I am learning Shell script
Line 2
Line 3
```

However, the content of `<file-name>` will remain unchanged.

### Summary

- `sed -i '1 a I am learning Shell script' <file-name>`: Modifies the file directly, appending the text after the first line and saving the changes to the file.
- `sed -e '1 a I am learning Shell script' <file-name>`: Outputs the modified content to the standard output without changing the original file.

## Lines update 37:51

`sed -e 's/sbin/SBIN/ passwd` passwd --> changes sbin to SBIN in passwd file

this replaces only first occurence of sbin to SBIN

if you want it to run globally to replace multiple instances use `g`

`sed -e 's/sbin/SBIN/g passwd` passwd --> changes sbin to SBIN in passwd file **Globally but temproty**

`sed -i 's/sbin/SBIN/g passwd` passwd --> changes sbin to SBIN in passwd file **Globally and permanent**
sed -e 's/word-to-find/word-to-replace/' --> by default first occurence in every lines

## deleting line in SED

`sed -e '1d' <file-name>`

`sed -e '2d' <file-name>`'

deletes 1st and 2nd lines

`sed -e '1,2d' <file-name>`

**`sed -e '/learning/ d' passwd`**

the above command deletes the line containing text *learning* from file *passwd*

## replacing the local host to point it to internet

change 127.0.0.1 to 0.0.0.0 in etc/mongod.conf

**`sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf`**

validate after sed command  

45:21 redirect output to log file

restart and mongo db using shell and validate

**Shiva-S14 - vid 3 - timestamp 43:51 SED**  

**I intend to finish this class today on Jun 16 10 :31**
**well today is june 23 22:57 and i have not completed this video so i strated to read for 3 mins**

mongo db configuration commands mongodb.sh

use command and then validate 

commmands with the validations and colors is the best way to use shell script


47:11

test the monogo db script by cloning the repo from the git 

48:24 mogodb installation successful, cheking using netstat -lntp


49:39 break 

49:50 break

## 49:52 catalogue.sh  

**stopping at 22:59 to avoid issue to health due to blue light**

I've not read yesteday because i was not prioritizing the study started on jun 25

**catalogue command and validate**

50:01 catalogue.sh creation

53:11 - catalogue.service file creation

53:50 - R53 creation for catalogue server - 

54:53 check directory before running command , either navigate to the proper directory or use absolute path **56:09**

**55:50 use absolute path for catalouge service**

57:38

58:55 installation of mongodb shell
installation of mongodb client 

1:00:53 catalogue server creation and installation of script

**Shiva-S14 - vid 3 - timestamp 1:00:53 installation of catalogue and creation of server **  
**Started reading on today sep 05 2024 at 11:12 AM**
1:1:33 catalogue server creation with SG - allowing all ports

connect to the catalogue server using putty client and clone the code into catalogue server (1:03:20)

fixing the catalogue.sh file (1:04:00) because we have to log the installation not the validation

debugging of catalogue app 1:08:47


1:09:20 unzipping and overwriting files if exists with modifier unzip -o 

1:11:14 improvements

check if user is created or not if already created then dont create

if directory is available dont create it again

1:12:57 will continue studying in the evening after coming from office at 8:30 pm till 9:30 pm 09-05-2024

you know the funny thing ! :) for some reason i opened laptop at 8:30 to study

```but unforutnately i didnt study but i created the amazon account so that i can practice while studying . 

why is this important ? Because i get distacted while listening to lecture, and my mind goes numb, to make it active and to complete class directly i am doing this.

i will start reading at tomorrow at 7: 30 am i.e. sep -06-2024 tomorrow, i will complete the class no 14```