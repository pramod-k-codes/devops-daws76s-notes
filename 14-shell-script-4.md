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

