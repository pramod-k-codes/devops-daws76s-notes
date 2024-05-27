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

### Explanation:
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
    yum list installed $1 >/dev/null 2>&1 # Check if the package is installed
    # yum info $1  # This line is commented out as it is not used in the function

    if [ $? -eq 0 ]; then # If the package is installed
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
}

ISROOTUSER
INSTALL_PACKAGES "$@"


```

check the script by
` sh -x 13v1-install-packages.sh ss j iw net-tools uy`








Shiva-S14 - vid 2 - timestamp 15:50

