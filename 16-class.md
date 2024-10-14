### Class 16 Shell Scripting Notes

---

### 1. **Introduction to Shell Scripting**

Shell scripting automates system tasks and operations on Unix-like systems. It can handle repetitive tasks, manage log files, disk usage, and send alerts, making it essential for system administration and DevOps.

---

### 2. **Basic Concepts**

#### 2.1 **Variables**

Variables store data that can be reused throughout a script.

- **Defining Variables:**
  ```bash
  name="John Doe"
  age=25
  ```
- **Accessing Variables:**
  Use the `$` symbol to access the value of a variable:
  ```bash
  echo "Name: $name"
  ```

#### 2.2 **Data Types**

Shell scripting treats all variables as strings by default, but you can work with numbers, arrays, and special types.

- Example:
  ```bash
  number=10
  echo "Number is $number"
  ```

---

### 3. **Conditional Statements**

Conditional statements allow you to control the flow of execution in a script.

#### 3.1 **If-Else Statements**

```bash
if [ condition ]; then
  # If block
else
  # Else block
fi
```

- **Example**: Check if a file exists:
  ```bash
  if [ -f "/path/to/file" ]; then
    echo "File exists"
  else
    echo "File does not exist"
  fi
  ```

#### 3.2 **Logical Operators**

- `&&` (AND): Both conditions must be true.
- `||` (OR): At least one condition must be true.
- `!` (NOT): Negates a condition.

Example:

```bash
if [ $age -gt 18 ] && [ $age -lt 30 ]; then
  echo "You are eligible"
fi
```

---

### 4. **Loops**

Loops allow you to repeat tasks multiple times.

#### 4.1 **For Loop**

```bash
for i in {1..5}; do
  echo "Iteration $i"
done
```

#### 4.2 **While Loop**

```bash
counter=1
while [ $counter -le 5 ]; do
  echo "Counter: $counter"
  counter=$((counter + 1))
done
```

---

### 5. **Functions**

Functions help you encapsulate logic and make it reusable.

- **Defining a Function:**

  ```bash
  my_function() {
    echo "This is my function"
  }
  ```
- **Calling a Function:**

  ```bash
  my_function
  ```

Example:

```bash
greet() {
  echo "Hello, $1!"
}
greet "Alice"
```

---

### 6. **Real-Time Use Cases**

#### 6.1 **Deleting Old Log Files-03:00**

**Problem:**
You have a folder `/tmp/shell-script-logs` storing log files, an d you want to delete `.log` files that are older than 14 days. We usually delete logs older than 14 days and only log files not other files

* Steps
  * Get souce directory
  * get .log files older than 14 days

```bash
#!/bin/bash

	# Define the directory to search for log files
SOURCE_DIR="/tmp/shellscript-logs"

	# Define color codes for output (Red, Green, Yellow, and Normal)
R="\e[31m"  # Red color for error messages
G="\e[32m"  # Green color (not used in this script)
Y="\e[33m"  # Yellow color (not used in this script)
N="\e[0m"   # Reset color to normal

	# Check if the directory does not exist (! means "not") -FIRST CHECK

if [ ! -d $SOURCE_DIR ]; then  # -d checks if the path is a directory
   echo -e "$R Source directory: $SOURCE_DIR does not exist. $N"	 # Print an error message in red if the directory doesn't exist
fi

	# Find log files older than 14 days in the specified directory
	# -type f: look for files only
	# -mtime +14: find files modified more than 14 days ago
	# -name "*.log": filter for files ending in .log (log files)

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")
# if you use . instead of $SOURCE_DIR it will look for files in current direcotry in following command 
# find . -type f -mtime +14 -name "*.log" 

# you need files more than 14 days which you can do it by touch command
touch -d 20231201 user.log	# touch -d yyyymmdd user.log	12:38

# Loop through each file found
while IFS= read -r line; do  # IFS= sets the Internal Field Separator to nothing, ensuring no word splitting occurs More detailed in next code block under IFS
    # Print the file being deleted
    echo "Deleting file: $line"
    # Delete the file (-rf removes it forcibly, even if it is a directory)
    rm -rf $line
done <<<"$FILES_TO_DELETE"  # Read the list of files from FILES_TO_DELETE

```

**Command to delete logs older than 14 days:**

```bash
find /tmp/shell-script-logs -type f -name "*.log" -mtime +14 -exec rm -rf {} \;
```

##### IFS

`explain this ------- IFS= read -r line`

That code snippet is used in Bash scripting for reading a line of text from standard input (usually the terminal) and storing it in a variable called `line`. Let's break it down:

* **`IFS=`** : This part temporarily sets the "Internal Field Separator" (IFS) to an empty value for the duration of the `read` command. IFS normally dictates how Bash splits a line of text into words, often using spaces, tabs, and newlines. By setting it to empty, we ensure that the entire line, including any spaces, is read into the variable without being split.
* **`read -r line`** : This is the core of the command:
* **`read`** : This is the built-in Bash command for reading input.
* **`-r`** : This option tells `read` to treat backslashes (`\`) as literal characters and not as escape sequences. This is important for preserving the original input, especially if it contains backslashes.
* **`line`** : This is the name of the variable where the read input will be stored.

**In essence, this code provides a robust way to read a complete line of text from the input, preserving spaces and special characters.**

```bash
echo "Enter a line of text: "
IFS= read -r line
echo "You entered: $line"

```

If you input "Hello world with spaces!", the output would be:

```plaintext
You entered: Hello world with spaces!

```

###### Read /etc/passwd file and display use information

```bash
#!/bin/bash
# This script reads the /etc/passwd file and displays user information.

file=/etc/passwd  # Define the file path

# Define color codes for output
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"  # Reset to default color

# Check if the file exists
if [ ! -f $file ]  # ! denotes negation (opposite)
then
    echo -e "$R Source directory: $file does not exists. $N"  # Print error message in red
    exit 1  # Exit the script with an error code
fi

# Read the file line by line
while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path
do
    # Split each line based on ":" as the delimiter
    # -r option prevents backslashes from being interpreted as escape sequences
  
    # Print user information
    echo "username: $username"
    echo "user ID: $user_id"
    echo "User Full name: $user_fullname"
done < $file  # Redirect input from the specified file

```

**Explanation****:**

1. **Header:**
   * `#!/bin/bash`: Specifies the interpreter for the script (Bash).
2. **File Path:**
   * `file=/etc/passwd`: Defines the path to the `/etc/passwd` file, which contains user account information.
3. **Color Codes:**
   * `R="\e[31m"`, `G="\e[32m"`, `Y="\e[33m"`, `N="\e[0m"`: Define ANSI escape codes for red, green, yellow, and reset colors, respectively.
4. **File Existence Check:**
   * `if [ ! -f $file ]`: Checks if the file exists using the `-f` operator. The `!` negates the result, so the condition is true if the file *doesn't* exist.
   * `echo -e "$R Source directory: $file does not exists. $N"`: Prints an error message in red if the file is not found.
   * `exit 1`: Exits the script with an error code if the file is missing.
5. **Reading the File:**
   * `while IFS=":" read -r username password user_id group_id user_fullname home_dir shell_path`: This loop reads each line of the `/etc/passwd` file.
     * `IFS=":"`: Sets the Internal Field Separator to `:`, which is the delimiter used in the `/etc/passwd` file.
     * `read -r`: Reads a line from the file and assigns the fields to the specified variables.
     * `-r`: Prevents backslashes from being interpreted as escape sequences.
6. **Printing User Information:**
   * `echo "username: $username"`: Prints the username.
   * `echo "user ID: $user_id"`: Prints the user ID.
   * `echo "User Full name: $user_fullname"`: Prints the user's full name.
7. **Input Redirection:**
   * `done < $file`: Redirects the input for the `while` loop from the specified file (`$file`).

**In summary, this script reads the `/etc/passwd` file, checks if it exists, and then prints the username, user ID, and full name for each user account in the file.**

---

### 7. **Managing Disk Usage 28:45**

checking disk usage `df -h vs df -hT`

```bash
# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       931G  722G  209G  78% /
/dev/sdb1       931G  722G  209G  78% /home

# df -hT
Filesystem      Type  Size  Used Avail Use% Mounted on
/dev/sda1       ext4  931G  722G  209G  78% /
/dev/sdb1       ext4  931G  722G  209G  78% /home

```

* `df -h` is the basic command for displaying disk space usage in a human-readable format.
* `df -hT` provides the same information as `df -h` but also includes the file system type

Monitoring team will monitor servers and websites

if servers are down or consuming more memory we need to get alerts to team so that team can ensure smooth operations

#### 7.1 **Disk Usage Alerts**

**Context:**
Monitoring servers is critical to avoid system crashes due to high memory or disk space usage. For example, when disk space crosses a threshold, an alert must be triggered to the DevOps team.

**Example Commands:**

- **Checking Disk Usage:**

  ```bash
  df -h
  ```
- **Send Alert via Email:**
  First, install email utilities:

  ```bash
  yum -y install postfix cyrus-sasl-plain mailx
  ```

  **Send an email:**

  ```bash
  echo "Disk space is critically low" | mail -s "Disk Alert" info@joindevops.com
  ```

---

### 8. **Handling Hard Disk Drives (HDD) and Network Drives**

**Addition of volumes to instance**

**To mount a vloume the volume must be in same avilability zone**

* create a volume in same az as in the instance az
* wait for volume to be available and attatch it to the instance , choose a name/path while attaching remember that the instance might be renamed by kernal automatically
* type `lsblk` to check if voulme is properly mounted

create a volume in which we have intance attatch the volume to instance which will look like below

```bash
34.204.84.67 | 172.31.32.238 | t2.micro | null
[ centos@ip-172-31-32-238 ~ ]$  lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   10G  0 disk
└─xvda1 202:1    0   10G  0 part /
xvdf    202:80   0  100G  0 disk
```

observe that xvdf is the mounted externam volume

create a filesystem using `file -s /dev/device-name`

```
[ root@ip-172-31-32-238 ~ ]# sudo file -s /dev/xvdf
/dev/xvdf: data

34.204.84.67 | 172.31.32.238 | t2.micro | null
[ root@ip-172-31-32-238 ~ ]# lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   10G  0 disk
└─xvda1 202:1    0   10G  0 part /
xvdf    202:80   0  100G  0 disk

```

check file system creation by `lsblk -f`

```
NAME    FSTYPE LABEL UUID                                 MOUNTPOINT
xvda
└─xvda1 xfs          6088d1e9-b24b-447b-9a77-7400d5e63b50 /
xvdf

```

`lsblk -p` will reveal the full path

create file system by using mkfs

`mkfs -t xfs /dev/xvdf`

[ root@ip-172-31-32-238 ~ ]# mkdir data
mkdir: cannot create directory ‘data’: File exists

34.204.84.67 | 172.31.32.238 | t2.micro | null
[ root@ip-172-31-32-238 ~ ]# mount /dev/xvdf /data

34.204.84.67 | 172.31.32.238 | t2.micro | null
[ root@ip-172-31-32-238 ~ ]#

Mounting the external drive

create a directory to mount the disk into the directory

`mkdir data`

mount the volume into directory

`mount /dev/xvdf /data`

if you encounter error check file system by `sudo fsck /dev/xvdf`

**df -hT vs lsblk -f**

The differences between `df -hT` and `lsblk -f`, both useful commands for inspecting storage devices and filesystems in Linux. Here's a comparison:

**`df -hT`**

* **Focus:** Disk space **usage** of **mounted** filesystems.
* **Output:**
  * Filesystem name
  * Filesystem **type** (ext4, xfs, etc.)
  * Total size, used space, available space (in human-readable units)
  * Percentage used
  * **Mount point** (where it's accessible in the filesystem)
* **Example:**
  ```bash
  Filesystem     Type      Size  Used Avail Use% Mounted on
  /dev/sda1      ext4       50G   20G   30G  40% /
  /dev/sdb1      xfs       100G  10G   90G  10% /data
  ```

**`lsblk -f`**

* **Focus:** Listing  **all block devices** , whether mounted or not, along with filesystem info.
* **Output:**
  * Device name (e.g., `/dev/sda`, `/dev/sdb1`)
  * Filesystem type (if present)
  * Label (if set)
  * UUID (unique identifier)
  * **Mount point** (if mounted)
* **Example:**
  ```plaintext
  NAME   FSTYPE   LABEL    UUID                                   MOUNTPOINT
  sda                                                           
  └─sda1 ext4     rootfs   some-long-uuid                         /
  sdb                                                           
  └─sdb1 xfs      data     another-uuid                          /data
  sr0    iso9660            yet-another-uuid                       /mnt/cdrom 
  ```

**Key Differences and When to Use Each:**

* **Mounted vs. All Devices:** `df` only shows mounted filesystems, while `lsblk` lists all block devices, even unmounted or empty ones.
* **Usage Information:** `df` emphasizes disk space usage (how full is it?), while `lsblk` focuses on device identification and relationships (partitions within disks).
* **Human-Readable Output:** `df -h` provides sizes in easy-to-understand units (GB, MB), while `lsblk` output is more technical.

**In Summary:**

* Use `df -hT` when you want to see how much space is used and available on your mounted filesystems.
* Use `lsblk -f` to get a complete overview of your block devices, their organization, and filesystem information, regardless of mounting status.

**In Summary**

To manage physical or network drives, you need to mount and format drives properly. Use these commands to interact with different types of drives:

- **List block devices:**

  ```bash
  lsblk
  ```
- **Check file system type:**

  ```bash
  sudo file -s /dev/xvdf
  ```
- **Format the disk to XFS:**

  ```bash
  sudo mkfs -t xfs /dev/xvdf
  ```
- **Mount the disk:**

  ```bash
  sudo mkdir /data
  sudo mount /dev/xvdf /data
  ```

---

### 9. **Sending Emails from Linux (Not explained in class just extra content)**

In shell scripts, you can automate sending emails using the Gmail API with `postfix`, `cyrus-sasl-plain`, and `mailx`.

#### 9.1 **Steps to Send Email:**

1. **Install Required Packages:**

   ```bash
   yum -y install postfix cyrus-sasl-plain mailx
   ```
2. **Setup Email Authentication:**

   - `postfix`: Sends the email.
   - `cyrus-sasl-plain`: Handles authentication.
   - `mailx`: Command to send the email.
3. **Example of Sending Email:**

   ```bash
   echo "This is a test mail & Date $(date)" | mail -s "message" info@joindevops.com
   ```

---

### Useful Disc usage operation comands to format the data

Command Summary:

1. **clear**

   - Clears the terminal screen.
2. **df -hT**

   - Displays disk space usage in human-readable format, showing file system type.
   - **Result**:
     ```
     Filesystem     Type      Size  Used Avail Use% Mounted on
     devtmpfs       devtmpfs  351M     0  351M   0% /dev
     tmpfs          tmpfs     384M     0  384M   0% /dev/shm
     tmpfs          tmpfs     384M  436K  384M   1% /run
     tmpfs          tmpfs     384M     0  384M   0% /sys/fs/cgroup
     /dev/xvda1     xfs        10G  1.9G  8.2G  19% /
     tmpfs          tmpfs      77M     0   77M   0% /run/user/1000
     /dev/xvdf      xfs       100G  746M  100G   1% /data
     ```
3. **df -ht | grep xfs**

   - This command throws an error due to missing argument for `-t` option.
   - **Result**:
     ```
     df: option requires an argument -- 't'
     Try 'df --help' for more information.
     ```
4. **df -hT | grep xfs**

   - Filters the disk space report to only show file systems with type `xfs`.
   - **Result**:
     ```
     /dev/xvda1     xfs        10G  1.9G  8.2G  19% /
     /dev/xvdf      xfs       100G  746M  100G   1% /data
     ```
5. **df -hT | grep -v tmp**

   - Shows disk space usage excluding file systems containing "tmp" in their names.
   - **Result**:
     ```
     /dev/xvda1     xfs        10G  1.9G  8.2G  19% /
     /dev/xvdf      xfs       100G  746M  100G   1% /data
     ```
6. **df -hT | grep -vE 'tmp|File'**

   - Excludes lines containing "tmp" or "File" from the disk space report.
   - **Result**:
     ```
     /dev/xvda1     xfs        10G  1.9G  8.2G  19% /
     /dev/xvdf      xfs       100G  746M  100G   1% /data
     ```

### Disk usage 41:00

    Finding disk usage

 **`df -hT | grep -vE 'tmp|File' | awk {'print $6'} | cut -d % -f1` . I didnt understand cut -d % -f1 why it works how it works**

You're right to be curious about `cut -d % -f1`! It's a clever way to extract the disk usage percentage from the output of `df`. Let's break it down:

**The Pipeline**

First, remember that the entire command is a pipeline:

1. `df -hT`: Lists filesystems with human-readable sizes and filesystem types.
2. `grep -vE 'tmp|File'`: Filters out lines containing "tmp" or "File" (likely temporary filesystems).
3. `awk {'print $6'}`: Prints the 6th column (the "Use%" column).
4. `cut -d % -f1`: This is where the magic happens!

**`cut -d % -f1` Explained**

* **`cut`** : This command is designed to extract portions of text from each line of input.
* **`-d %`** : This sets the "delimiter" to the percent sign (`%`). Think of a delimiter as a separator between fields of data on a line.
* **`-f1`** : This tells `cut` to extract only the "first field" based on the delimiter.

**How It Works**

Let's imagine a line of output from the previous stages of the pipeline:

```plaintext
/dev/sda1       ext4       50G   20G   30G  40% /
```

1. **Delimiter:** `cut -d %` sees the `%` sign as the delimiter, dividing the line into two fields:
   * Field 1: `/dev/sda1 ext4 50G 20G 30G 40`
   * Field 2: `/` (the space and the mount point)
2. **Field Selection:** `-f1` instructs `cut` to keep only the first field.

**Result:** The command outputs `40`, effectively extracting the disk usage percentage.

**Why It's Useful**

This technique is powerful because it lets you easily isolate specific pieces of information from command output, even if the output format isn't perfectly consistent.


### DO WHILE loop

statement `while IFS= read line` is correct because of following explanation among the following statements


```bash
while IFS=read line # no spaces correct assignment such as DISKNAME="11" but this statement fails to read lines
while IFS= read line # this is correctly working not sure why, because this has a space after = making it 'IFS= ' in statement which should not work because this is as signing space to IFS as per my knowledge
while IFS = read line #This is syntax error because assignment should not have spaces around = in bash which makes assignment 'IFS = read line'
while IFS =read line #Also invalid statement because of space before assignment symbol = which makes assignment 'IFS ='
```



Let's break down each of these statements and explain why they work or don't work:

1. `while IFS=read line`
   This statement doesn't work as intended. Here's why:

   - In Bash, variable assignments should not have spaces around the `=` sign.
   - This actually assigns the string "read" to the IFS variable, and then tries to execute "line" as a command.
   - It doesn't read lines from input as intended.
2. `while IFS= read line`
   This statement works correctly. Here's the explanation:

   - This sets IFS to an empty string (not a space).
   - The space after `=` is not part of the assignment; it separates the IFS assignment from the `read` command.
   - Setting IFS to an empty string before `read` preserves leading/trailing whitespace in the input.
3. `while IFS = read line`
   This is indeed a syntax error. Here's why:

   - In Bash, variable assignments must not have spaces around the `=` sign.
   - This tries to run a command named "IFS" with "=" and "read" as arguments, followed by running "line" as another command.
4. `while IFS =read line`
   This is also invalid. Here's the explanation:

   - The space before `=` makes Bash interpret "IFS" as a command to run.
   - It then tries to run a command named "=read" with "line" as an argument.

The correct and commonly used form is `while IFS= read -r line`. The `-r` option prevents backslash escapes from being interpreted, which is usually desired when reading arbitrary input.

To clarify your understanding: in `IFS= read line`, the IFS assignment and the `read` command are two separate operations. The assignment sets IFS to an empty string, and then the `read` command is executed with this IFS setting in effect.


```bash
#!/bin/bash

# Capture the disk usage information using df -hT while excluding 'tmp' and 'File' lines.
# df -hT: shows the disk space usage with human-readable sizes and filesystem type.
# grep -vE 'tmp|File': excludes lines containing 'tmp' or 'File' from the output.
DISK_USAGE=$(df -hT | grep -vE 'tmp|File')

# Set the disk usage threshold. This value is set to 1% for demonstration purposes.
# In a real scenario, you would set this to a higher value, such as 80% or 90%.
DISK_THRESHOLD=1

# Initialize an empty variable to hold the disk usage warning messages.
# The variable 'message' will accumulate lines as we detect high usage partitions.
message=""

# Begin a while loop that reads the disk usage line by line from the output stored in DISK_USAGE.
# The IFS= ensures that the read command does not split the input based on spaces, which allows reading each line as a whole.
# The <<< "$DISK_USAGE" syntax feeds the content of the DISK_USAGE variable as input to the while loop.
while IFS= read line
do
    # Extract the disk usage percentage from the 6th field (column) of the line.
    # 'awk' is used to get the 6th column, which is the disk usage percentage in the df output.
    # 'cut -d % -f1' removes the '%' sign from the extracted usage percentage so it can be used as a numeric value.
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)

    # Extract the partition or filesystem name from the 1st field (column) of the line.
    # This corresponds to the name of the partition being checked (e.g., /dev/xvda1).
    partition=$(echo $line | awk '{print $1}')

    # Check if the extracted usage percentage is greater than or equal to the disk usage threshold.
    # If the usage exceeds the threshold, an alert message is generated.
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        # Use the += operator to append a new message to the 'message' variable.
        # The <br> tag is added at the end to ensure that the message is formatted correctly if sent in an HTML email.
        message+="High Disk Usage on $partition: $usage% <br>"
    fi
done <<< "$DISK_USAGE"  # The <<< operator feeds the content of DISK_USAGE as input to the while loop.

# After processing all lines, display the constructed message.
# The -e option in echo allows for interpreting escape characters like \n for new lines.
echo -e "Message: $message"

# The following line is commented out, but if enabled, it would send the message via email.
# This email would alert the administrator of any high disk usage issues.
# echo "$message" | mail -s "High Disk Usage" info@joindevops.com

# The script then calls an external 'mail.sh' script to send an email.
# The arguments to the mail.sh script include:
# 1. "DevOps Team" as the recipient group.
# 2. "High Disk Usage" as the subject.
# 3. The message body constructed in the script.
# 4. The recipient email address (info@joindevops.com).
# 5. "ALERT High Disk Usage" as an additional alert description.
sh mail.sh "DevOps Team" "High Disk Usage" "$message" "info@joindevops.com" "ALERT High Disk Usage"
```

### Key Concepts:

1. **`<<<` Operator**:

   - The `<<<` operator is known as a "here string." It feeds the content of a variable (in this case, `DISK_USAGE`) as input to the while loop. Instead of needing a file or a stream of input, the `while` loop processes the string directly.
   - Syntax: `while IFS= read line; do ...; done <<< "$DISK_USAGE"`.
   - This is equivalent to using input redirection (`<`), but specifically for a single string.
2. **`+=` Operator**:

   - The `+=` operator is used to append to a string. Here, it adds a new line to the `message` variable each time the disk usage exceeds the threshold.
   - In the line `message+="High Disk Usage on $partition: $usage% <br>"`, the new alert message is appended to the existing `message` string.
   - This is useful when constructing a larger message by adding multiple parts to it in a loop.
3. **`awk` and `cut`**:

   - `awk '{print $6}'` extracts the 6th column from each line of the `df` command output. This is where the disk usage percentage is stored.
   - `cut -d % -f1` removes the `%` symbol from the percentage value so that it can be used as a number in the conditional check (`if [ $usage -ge $DISK_THRESHOLD ]`).
4. **`IFS= read line`**:

   - `IFS=` prevents the `read` command from splitting the input based on whitespace. Instead, it reads each line as a single string, allowing the loop to process the entire line at once.
   - This is important when parsing output like `df`, where spaces separate fields but the entire line needs to be read.
5. **Message Construction**:

   - As the script loops through each line of the disk usage report, it constructs a message by appending alerts for any partitions exceeding the threshold.
   - The `<br>` HTML tag is included to ensure the message will display properly if it's sent as an HTML-formatted email.

### Summary:

This script monitors disk usage by reading the output of the `df -hT` command, excluding temporary filesystems. For each partition, it checks if the disk usage exceeds a predefined threshold. If it does, the script constructs a message detailing the partitions with high usage. It can optionally send this message via email to a designated recipient. The `while` loop, `<<<` operator, and `+=` string appending allow the script to efficiently process the output and build a detailed alert message.

### 10. **Example Script for Deleting or Archiving Logs**

This script automates log file management, including both deletion and archiving of logs based on user input.

```bash
#!/bin/bash

# Default values
days=14
memory_limit=""

while getopts "s:a:d:t:m:" opt; do
  case $opt in
    s) source_dir="$OPTARG" ;;
    a) action="$OPTARG" ;;
    d) dest_dir="$OPTARG" ;;
    t) days="$OPTARG" ;;
    m) memory_limit="$OPTARG" ;;
    *) echo "Usage: $0 -s <source-dir> -a <archive/delete> -d <destination-dir> -t <no-days> -m <memory-in-mb>" ;;
  esac
done

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Source directory does not exist"
  exit 1
fi

if [ "$action" = "archive" ]; then
  if [ -z "$dest_dir" ]; then
    echo "Please provide a destination directory for archive"
    exit 1
  fi
  # Archive command
  find "$source_dir" -type f -name "*.log" -mtime +$days -exec mv {} "$dest_dir" \;
else
  # Delete command
  find "$source_dir" -type f -name "*.log" -mtime +$days -exec rm -rf {} \;
fi
```

---

### 11. **Q&A for Quick Revision**

#### Q1: What command would you use to delete `.log` files older than 14 days?

- **A:** Use the `find` command:
  ```bash
  find /path/to/logs -type f -name "*.log" -mtime +14 -exec rm -rf {} \;
  ```

#### Q2: How can you check disk usage in Linux?

- **A:** Use the `df -h` command:
  ```bash
  df -h
  ```

#### Q3: How can you send an email using a shell script?

- **A:** After setting up `postfix` and `mailx`, use the following command:
  ```bash
  echo "Test email" | mail -s "Subject" email@example.com
  ```

#### Q4: What is the purpose of `lsblk` in shell scripting?

- **A:** The `lsblk` command lists all available block devices (disks and partitions) on the system.

#### Q5: How do you create a function in a shell script?

- **A:** Define the function using the following syntax:
  ```bash
  my_function() {
    echo "Function logic here"
  }
  ```

---

These notes provide a comprehensive overview of shell scripting concepts, real-time examples, and Q&A for quick revision. The real-world examples show how you can automate tasks such as log management and disk monitoring.
