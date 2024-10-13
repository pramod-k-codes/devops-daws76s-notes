creation of 5 instances with allow all SG

  * web t2-micro
* catalogue t2-micro
* user t2-micro
* cart t2-micro
* redis t2-micro
* shell t2-micro
* mongodb t3.small
  ts 1:55

open roboshop documentation, get a domain

update the r53 records

# Stopping the script execution on failure **`set -e`**

## Purpose of `set -e`

In a shell script, when a command fails (returns a non-zero exit status), the script usually continues to execute the next commands. By adding `set -e` at the beginning of the script, you force the script to exit immediately if any command fails.

### Example Without `set -e`

```bash
#!/bin/bash
echo "Starting script..."

# This command fails (non-zero exit status)
ls /non/existent/directory

# This command still runs, even though the previous command failed
echo "This will still be executed."
```

In this example:

1. The `ls /non/existent/directory` will fail because the directory doesn't exist.
2. Despite the failure, the script will continue to execute, and the `echo` statement will be printed.

### Example With `set -e`

```bash
#!/bin/bash
set -e
echo "Starting script..."

# This command fails (non-zero exit status)
ls /non/existent/directory

# This command will NOT run if the previous command fails
echo "This will NOT be executed."
```

With `set -e`, once the `ls /non/existent/directory` command fails, the script will terminate, and the last `echo` statement will not be executed.

### Use Cases

- When you want your script to stop at the first error to prevent subsequent commands from running and causing further issues.
- Ideal for deployment scripts or installation scripts where a failure in one step should stop the entire process.

Would you like to explore other related options like `set -x` (for debugging) or `trap` for handling failures?

## set -x set -e trap

Great! Let's dive into two other useful shell options: `set -x` for debugging and `trap` for handling failures.

### 1. `set -x` (Debugging)

The `set -x` command enables a mode of the shell where each command, after being expanded but before being executed, is printed to the terminal. This is extremely helpful for debugging scripts as it allows you to see exactly what commands are being run and in what order.

#### Example Using `set -x`

```bash
#!/bin/bash
set -x
echo "Starting script..."

# This command will fail, but you'll see its execution in the output
ls /non/existent/directory

echo "Script continues..."
```

**Output**:

```bash
+ echo 'Starting script...'
Starting script...
+ ls /non/existent/directory
ls: cannot access '/non/existent/directory': No such file or directory
+ echo 'Script continues...'
Script continues...
```

Here, the `+` symbols indicate that the commands are being printed before their execution. This lets you track the script's flow step by step. You can disable this debug mode later in the script using `set +x`.

### Use Case

- Helpful for debugging large scripts where you want to see which commands are being executed and their expanded forms.
- Works well in combination with `set -e` to see what command caused the script to exit.

### 2. `trap` (Handling Failures)

The `trap` command allows you to specify a command or script that should run when the script exits or encounters a signal (like an error or interruption). You can use it to clean up resources, print an error message, or perform other tasks before the script exits.

#### Example Using `trap`

```bash
#!/bin/bash
trap 'echo "An error occurred! Cleaning up..."' ERR
set -e
echo "Starting script..."

# This will cause the trap to be triggered
ls /non/existent/directory

echo "This will not be executed."
```

In this example:

- The `trap` command listens for the `ERR` signal, which is triggered when any command fails.
- When the `ls` command fails, the script will execute the command specified by `trap` (printing the error message in this case).
- Because of `set -e`, the script will then exit, preventing the last `echo` from running.

You can also use `trap` for cleanup tasks like deleting temporary files or stopping background processes.

#### Common `trap` Signals

- `EXIT`: Triggered when the script exits (successfully or otherwise).
- `ERR`: Triggered when a command fails (only when `set -e` is enabled).
- `INT`: Triggered when the script is interrupted (e.g., by pressing Ctrl+C).

### Example for Cleanup:

```bash
#!/bin/bash
trap 'rm -f /tmp/tempfile.txt; echo "Cleanup done!"' EXIT
echo "Creating temp file..."
touch /tmp/tempfile.txt

# Simulate some commands
sleep 2

# The temp file will be deleted automatically upon exit
echo "Exiting script..."
```

### Use Case

- For ensuring cleanup actions like removing temporary files or stopping processes.
- Useful in scripts that manage resources or need to handle unexpected failures gracefully.

### Combining `set -e`, `set -x`, and `trap`

You can combine all three commands to make your scripts more robust, easier to debug, and handle failures cleanly.

#### Example:

```bash
#!/bin/bash
set -e
set -x
trap 'echo "An error occurred! Cleaning up..."' ERR

echo "Starting script..."

# Simulate commands
ls /non/existent/directory

echo "This will not run because of set -e."
```

Would you like to try combining these features into a script for a specific task? Or would you like further clarification on any of these commands?


Disadvantage in shell script - we need to check each statement is executed successfully or not ( if you are not using set -e)

when you are using set -e it will exit when command fails

alternative to adding &>>$LOGFILE is using statment `exec &>$$LOGFILE`
