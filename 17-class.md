* Cron
* 

# cron 

---


## **Delete Old Logs Using a Shell Script**

### **Objective**:

- Delete old log files from a specified directory that are older than 14 days using a shell script, and automate this task using `cron`.

### **Steps**:

1. **Create the Shell Script**:

   - Write a script to find and delete files older than 14 days.
   - The `find` command can be used to search for files by their modification date and delete them.

   **Example Script** (`delete_old_logs.sh`):

   ```bash
   #!/bin/bash

   # Specify the target directory (change this to your log directory)
   LOG_DIR="/path/to/log/directory"

   # Find and delete log files older than 14 days
   find "$LOG_DIR" -type f -name "*.log" -mtime +14 -exec rm -f {} \;

   echo "Old logs deleted from $LOG_DIR"
   ```
2. **Testing the Script**:

   - To simulate old log files, create files with past timestamps using the `touch` command.

   **Example**:

   ```bash
   touch -t 202309010101 /path/to/log/directory/oldfile.log
   ```

   - This creates a file with a timestamp of September 1st, 2023.
3. **Schedule the Script Using Crontab**:

   - Open the crontab editor by running:
     ```bash
     crontab -e
     ```
   - Add a cron job to execute the script at regular intervals (e.g., daily at 4 AM).

   **Example Cron Entry**:

   ```bash
   0 4 * * * /path/to/delete_old_logs.sh
   ```

   - This cron job will run the script every day at 4:00 AM.
4. **Verify the Script Execution**:

   - To observe file deletions in real-time, navigate to the target directory and use:
     ```bash
     watch ls -l
     ```
   - This will show you a live view of the directory’s contents as files are deleted.
5. **Monitor Cron Job Logs**:

   - To check the logs for your cron jobs, use the following command:
     ```bash
     tail -f /var/log/cron
     ```
   - This will display the cron execution logs and help troubleshoot any issues.

### **Crontab Syntax**:

- A cron expression is followed by the absolute path of the script you wish to run.

  **Example**:

  ```bash
  * * * * * /path/to/script.sh
  ```

  - The above cron expression will execute the script every minute.

### **Helpful Tools**:

- Use [Crontab Guru](https://crontab.guru) to easily create and validate cron expressions.

---

# Shell script opt args

Instead of positional parameters $1 . $2 and like below

PERSON=$1

we use option arguments

we will use switch case to achive this - this is caleld get ops aka get options

if someone gives invalid arguments we must give usage examples like shell does

time stamp - 12:52




### **AWS EC2 and Route53 Setup**

1. **Create EC2 Instances**:
   - Use `t3.small` for MongoDB, MySQL, and shipping.
   - Use `t2.micro` for the remaining instances.
2. **Route53 Records**:
   - Public IP for the web server, private IP for others.

---

### **IAM (Identity Access Management)**

- **Authentication**: Username/Password.
- **Authorization**: Role-based permissions to access project areas.

### **Roles and Permissions**:

- **Roles**:

  - **Team Manager**: Super admin.
  - **Team Lead**: Admin.
  - **Senior Engineers**: Normal access.
  - **Trainee**: READ access only.
- **Permissions**: Defined by resources (nouns) and actions (verbs):

  - **Resources** (nouns): EC2, VPC, Route53, IAM, etc.
  - **Actions** (verbs): Create, Read, Update, Delete.

### **User Roles**:

- **Sivakumar (Trainee)**: EC2 Web - READ.
- **Trishant (Junior DevOps Engineer)**: EC2 Web - READ & UPDATE.
- **Sandhya (Senior Engineer)**: EC2 Web - Create, Read, Update.
- **Aditya (Team Lead)**: EC2 Web, Cart, Catalogue - Create, Read, Update.
- **Akhila (Team Manager)**: EC2 Web, Cart, Catalogue - Create, Read, Update, Delete.

---

### **AWS Instance Management**

- **Instance Creation Command**:

  ```bash
  aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type t2.micro --security-group-ids sg-087e7afb3a936fce7
  ```
- **Steps**:

  1. Create one user and assign admin access.
  2. Create access keys:
     - Access Key: `AKIAUSW45M2WHLZYIMFP`
     - Secret Key: `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`
  3. Create a role, attach permissions, and associate it with the instance.

---

### **Algorithm for EC2 and Route53 Setup**:

1. **Create EC2 Instance**:

   ```bash
   aws ec2 run-instances --image-id ami-03265a0778a880afb --instance-type t2.micro --security-group-ids sg-087e7afb3a936fce7 --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=production}]'
   ```
2. **Configure MongoDB, MySQL**:

   - Use `t3.small` for these services.
   - Use `t2.micro` for other instances.
3. **Configure Route53**:

   - Get the IP address and create Route53 record:
     ```bash
     aws route53 change-resource-record-sets \
       --hosted-zone-id 1234567890ABC \
       --change-batch '
       {
         "Comment": "Testing creating a record set",
         "Changes": [{
           "Action"              : "CREATE",
           "ResourceRecordSet"  : {
             "Name"              : "'" $ENV "'.company.com",
             "Type"              : "A",
             "TTL"               : 1,
             "ResourceRecords"   : [{
               "Value"           : ""
             }]
           }
         }]
       }'
     ```

### **Improvements**:

1. If web server, get the public IP and create records.
2. Check if records exist:
   - If exists, update.
   - If not, create.

---

These notes outline the steps and commands for handling AWS resources, IAM roles, and the logic for setting up EC2 instances and Route53 records.
