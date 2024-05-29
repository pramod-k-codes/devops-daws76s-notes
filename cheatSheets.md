# 1. cheat sheets
- [1. cheat sheets](#1-cheat-sheets)
  - [1.1. git commands](#11-git-commands)
  - [1.2. Linux commands](#12-linux-commands)

## 1.1. git commands

1. `𝗴𝗶𝘁 𝗶𝗻𝗶𝘁`: Initializes a new Git repository in the current directory.
2. `𝗴𝗶𝘁 𝗰𝗹𝗼𝗻𝗲 [𝘂𝗿𝗹]`: Clones a repository into a new directory.
3. `𝗴𝗶𝘁 𝗮𝗱𝗱 [𝗳𝗶𝗹𝗲]`: Adds a file or changes in a file to the staging area.
4. `𝗴𝗶𝘁 𝗰𝗼𝗺𝗺𝗶𝘁 -𝗺 "[𝗺𝗲𝘀𝘀𝗮𝗴𝗲]"`: Records changes to the repository with a descriptive message.
5. `𝗴𝗶𝘁 𝗽𝘂𝘀𝗵`: Uploads local repository content to a remote repository.
6. `𝗴𝗶𝘁 𝗽𝘂𝗹𝗹`: Fetches changes from the remote repository and merges them into the local branch.
7. `𝗴𝗶𝘁 𝘀𝘁𝗮𝘁𝘂𝘀`: Displays the status of the working directory and staging area.
8. `𝗴𝗶𝘁 𝗯𝗿𝗮𝗻𝗰𝗵`: Lists all local branches in the current repository.
9. `𝗴𝗶𝘁 𝗰𝗵𝗲𝗰𝗸𝗼𝘂𝘁 [𝗯𝗿𝗮𝗻𝗰𝗵]`: Switches to the specified branch.
10. `𝗴𝗶𝘁 𝗺𝗲𝗿𝗴𝗲 [𝗯𝗿𝗮𝗻𝗰𝗵]`: Merges the specified branch's history into the current branch.
11. `𝗴𝗶𝘁 𝗿𝗲𝗺𝗼𝘁𝗲 -𝘃`: Lists the remote repositories along with their URLs.
12. `𝗴𝗶𝘁 𝗹𝗼𝗴`: Displays commit logs.
13. `𝗴𝗶𝘁 𝗿𝗲𝘀𝗲𝘁 [𝗳𝗶𝗹𝗲]`: Unstages the file, but preserves its contents.
14. `𝗴𝗶𝘁 𝗿𝗺 [𝗳𝗶𝗹𝗲]`: Deletes the file from the working directory and stages the deletion.
15. `𝗴𝗶𝘁 𝘀𝘁𝗮𝘀𝗵`: Temporarily shelves (or stashes) changes that haven't been committed.
16. `𝗴𝗶𝘁 𝘁𝗮𝗴 [𝘁𝗮𝗴𝗻𝗮𝗺𝗲]`: Creates a lightweight tag pointing to the current commit.
17. `𝗴𝗶𝘁 𝗳𝗲𝘁𝗰𝗵 [𝗿𝗲𝗺𝗼𝘁𝗲]`: Downloads objects and refs from another repository.
18. `𝗴𝗶𝘁 𝗺𝗲𝗿𝗴𝗲 --𝗮𝗯𝗼𝗿𝘁`: Aborts the current conflict resolution process, and tries to reconstruct the pre-merge state.
19. `𝗴𝗶𝘁 𝗿𝗲𝗯𝗮𝘀𝗲 [𝗯𝗿𝗮𝗻𝗰𝗵]`: Reapplies commits on top of another base tip, often used to integrate changes from one branch onto another cleanly.
20. `𝗴𝗶𝘁 𝗰𝗼𝗻𝗳𝗶𝗴 --𝗴𝗹𝗼𝗯𝗮𝗹 𝘂𝘀𝗲𝗿.𝗻𝗮𝗺𝗲 "[𝗻𝗮𝗺𝗲]" 𝗮𝗻𝗱 𝗴𝗶𝘁 𝗰𝗼𝗻𝗳𝗶𝗴 --𝗴𝗹𝗼𝗯𝗮𝗹 𝘂𝘀𝗲𝗿.𝗲𝗺𝗮𝗶𝗹 "[𝗲𝗺𝗮𝗶𝗹]"`: Sets the name and email to be used with your commits.
21. `𝗴𝗶𝘁 𝗱𝗶𝗳𝗳`: Shows changes between commits, commit and working tree, etc.
22. `𝗴𝗶𝘁 𝗿𝗲𝗺𝗼𝘁𝗲 𝗮𝗱𝗱 [𝗻𝗮𝗺𝗲] [𝘂𝗿𝗹]`: Adds a new remote repository.
23. `𝗴𝗶𝘁 𝗿𝗲𝗺𝗼𝘁𝗲 𝗿𝗲𝗺𝗼𝘃𝗲 [𝗻𝗮𝗺𝗲]`: Removes a remote repository.
24. `𝗴𝗶𝘁 𝗰𝗵𝗲𝗰𝗸𝗼𝘂𝘁 -𝗯 [𝗯𝗿𝗮𝗻𝗰𝗵]`: Creates a new branch and switches to it.
25. `𝗴𝗶𝘁 𝗯𝗿𝗮𝗻𝗰𝗵 -𝗱 [𝗯𝗿𝗮𝗻𝗰𝗵]`: Deletes the specified branch.
26. `𝗴𝗶𝘁 𝗽𝘂𝘀𝗵 --𝘁𝗮𝗴𝘀`: Pushes all tags to the remote repository.
27. `𝗴𝗶𝘁 𝗰𝗵𝗲𝗿𝗿𝘆-𝗽𝗶𝗰𝗸 [𝗰𝗼𝗺𝗺𝗶𝘁]`: Picks a commit from another branch and applies it to the current branch.
28. `𝗴𝗶𝘁 𝗳𝗲𝘁𝗰𝗵 --𝗽𝗿𝘂𝗻𝗲`: Prunes remote tracking branches no longer on the remote.
29. `𝗴𝗶𝘁 𝗰𝗹𝗲𝗮𝗻 -𝗱𝗳`: Removes untracked files and directories from the working directory.
30. `𝗴𝗶𝘁 𝘀𝘂𝗯𝗺𝗼𝗱𝘂𝗹𝗲 𝘂𝗽𝗱𝗮𝘁𝗲 --𝗶𝗻𝗶𝘁 --𝗿𝗲𝗰𝘂𝗿𝘀𝗶𝘃𝗲`: Initializes and updates submodules recursively.


## 1.2. Linux commands

1. `ls`: List directory contents
2. `cd`: Change directory
3. `pwd`: Print working directory
4. `mkdir`: Create a directory
5. `touch`: Create a file
6. `cp`: Copy files and directories
7. `mv`: Move or rename files and directories
8. `rm`: Remove files and directories
9. `find`: Search for files and directories
10. `grep`: Search for patterns in files
11. `cat`: Concatenate and display files
12. `less`: View file contents page by page
13. `head`: Display the first lines of a file
14. `tail`: Display the last lines of a file
15. `vi/vim`: Text editor
16. `nano`: Text editor
17. `tar`: Archive and compress files
18. `gzip`: Compress files
19. `gunzip`: Decompress files
20. `wget`: Download files from the web
21. `curl`: Transfer data to or from a server
22. `ssh`: Secure shell remote login
23. `scp`: Securely copy files between hosts
24. `chmod`: Change file permissions
25. `chown`: Change file ownership
26. `chgrp`: Change group ownership
27. `ps`: Display running processes
28. `top`: Monitor system resources and processes
29. `kill`: Terminate processes
30. `df`: Display disk space usage
31. `du`: Estimate file and directory space usage
32. `free`: Display memory usage
33. `uname`: Print system information
34. `ifconfig`: Configure network interfaces
35. `ping`: Test network connectivity
36. `netstat`: Network statistics
37. `iptables`: Firewall administration
38. `systemctl`: Manage system services
39. `journalctl`: Query the system journal
40. `crontab`: Schedule cron jobs
41. `useradd`: Create a user account
42. `passwd`: Change user password
43. `su`: Switch user
44. `sudo`: Execute a command as another user
45. `usermod`: Modify user account
46. `groupadd`: Create a group
47. `groupmod`: Modify a group
48. `id`: Print user and group information
49. `ssh-keygen`: Generate SSH key pairs
50. `rsync`: Synchronize files and directories
51. `diff`: Compare files line by line
52. `patch`: Apply a patch to files
53. `tar`: Extract files from an archive
54. `curl`: Perform HTTP requests
55. `nc`: Netcat - networking utility
56. `wget`: Download files from the web
57. `whois`: Lookup domain registration details
58. `dig`: DNS lookup utility
59. `sed`: Stream editor for text manipulation
60. `awk`: Pattern scanning and processing language
61. `sort`: Sort lines in a text file
62. `cut`: Extract sections from lines of files
63. `wc`: Word, line, character, and byte count
64. `tee`: Redirect output to multiple files or commands
65. `history`: Command history
66. `source`: Execute commands from a file in the current shell
67. `alias`: Create command aliases
68. `ln`: Create links between files
69. `uname`: Print system information
70. `lsof`: List open files and processes
71. `mkfs`: Create a file system
72. `mount`: Mount a file system
73. `umount`: Unmount a file system
74. `ssh-agent`: Manage SSH keys in memory
75. `grep`: Search for patterns in files
76. `tr`: Translate characters
77. `cut`: Select portions of lines from files
78. `paste`: Merge lines of files
79. `uniq`: Report or omit repeated lines