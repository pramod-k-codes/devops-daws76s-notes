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


Shiva-S14 - vid 1 - timestamp 15:50

