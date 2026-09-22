# Linux-Fundamentals

### 1) Environment Setup

1. Open **Microsoft Azure** then search **Resource Groups** and select **Create** then give the **Resource Group** the following settings then create the **Resource Group**
   - **Name:** RG-01
   - **Region:** South Central US
  
<p align="center">
  Image 1
</p>

2. Search **Virtual Network** and select **Create** then give the **Virtual Network** the following settings then create the **Virtual Network**
   - **Resource Group:** RG-01
   - **Name:** VNet-01
   - **Region:** South Central US
  
<p align="center">
  Image 2
</p>

3. Search **Virtual Machines** then **Create** then give the **Virtual Machine** the following settings then create the **Virtual Machine**
   - **Basics**
     - **Resource Group:** RG-01
     - **Name:** Linux-VM
     - **Image:** Ubuntu Server 22.04 LTS
     - **Size:** 2 vcpus
     - **Username:** userryan
   - **Networking**
     - **Virtual Network:**
    
<p align="center">
  Image 3
  Image 4
</p>

---

### 2) Basic System Orientation

1. Connect to the **Virtual Machine** using the following **Placeholder Value** (replace the path and IP with your own values)
`ssh -i "path/to/your-key.pem" username@your-vm-public-ip`

<p align="center">
  Image 5
</p>

2. Run **clear**
`Clears the terminal screen, giving a clean starting point before moving into the next set of commands.`

<p align="center">
  Image 5.5
</p>

3. Run **pwd**
`Displays the current working directory, confirming you're in /home/userryan right after logging in.`

<p align="center">
  Image 6
</p>

4. Run **whoami**
`Confirms the currently logged-in user account.`

<p align="center">
  Image 7
</p>

5. Run **id**
`Shows your user ID (UID), group ID (GID), and all groups you belong to.`

<p align="center">
  Image 8
</p>

6. Run **uname -a**
`Prints kernel name, version, and system architecture.`

<p align="center">
  Image 9
</p>

7. Run **cat /etc/os-release**
`Displays the Linux distribution name and version details.`

<p align="center">
  Image 10
</p>

8. Run **grep -i ubuntu /etc/os-release**
`Uses grep to filter the os-release output down to just the lines mentioning "ubuntu," highlighting the matches — a quick way to confirm the distro without reading the full file.`

<p align="center">
  Image 11
</p>

---

### 3) Filesystem Hierarchy Exploration

1. Run **ls -la /**
`Lists all top-level directories in the Linux filesystem, including hidden ones, along with permissions, ownership, and size details.`

<p align="center">
  Image 12
</p>

2. Run **cd /etc** then **ls -la**
`Navigates into /etc, the directory holding system-wide configuration files, and lists its contents.`

<p align="center">
  Image 13
</p>

3. Run **cd -** to return to the previous directory
4. Run **cd /var** then **ls -la**
`Navigates into /var, the directory holding variable data such as logs and caches, and lists its contents.`

<p align="center">
  Image 14
</p>

5. Run **cd -** to return to the previous directory
6. Run **cd /tmp** then **ls -la**
`Navigates into /tmp, the directory used for temporary files that are cleared on reboot, and lists its contents.`

<p align="center">
  Image 15
</p>

7. Run **cd -** to return to the previous directory then run **clear**

---

### 4) Navigation, Search & Getting Help

1. Run **find /etc -name "*.conf" | head**
`Searches the /etc directory for files ending in .conf, piping the results to head to show just the first several matches.`

<p align="center">
  Image 16
</p>

2. Run **sudo apt install mlocate**
`Installs the mlocate package, which provides the locate command`

<p align="center">
  Image 17
</p>

3. Run **sudo updatedb**
`Builds the database that locate searches against, indexing the filesystem.`

<p align="center">
  Image 18
</p>

4. Run **locate password**
`Searches the indexed database for any file with "passwd" in its name or path, demonstrating how locate differs from find (instant lookup vs. live filesystem search).`

<p align="center">
  Image 19
</p>

5. Run **which bash**
`Shows the full path to the bash executable.`

<p align="center">
  Image 20
</p>

6. Run **which ssh**
`Shows the full path to the ssh executable.`

<p align="center">
  Image 21
</p>

7. Run **man ls**
`Opens the manual page for ls, showing full documentation including all available options. Press q to exit.`

<p align="center">
  Image 22
</p>

8. Run **ls --help**
`Displays a quick built-in summary of ls options, faster to reference than the full man page.`

<p align="center">
  Image 23
</p>

9. Run **apropos user**
`Searches all man page descriptions for the keyword "user," useful for discovering commands when you don't know the exact name you're looking for.`

<p align="center">
  Image 24
</p>

10. Run **clear**

---

### 5) User & Group Management

1. Run **sudo useradd -m -c "John Smith" johnsmith**
`Creates a new user named johnsmith with a home directory (-m) and a comment field storing the full name.`
2. Run **sudo passwd johnsmith**
`Sets a password for the new user. You'll be prompted to type and confirm it.`

<p align="center">
  Image 25
</p>

3. Run **sudo useradd -m -c "Jane Doe" janedoe**
`Creates a second user, janedoe, following the same pattern.`
4. Run **sudo passwd janedoe**
`Sets a password for janedoe.`

<p align="center">
  Image 26
</p>

5. Run **sudo groupadd finance**
`Creates a new group called finance.`
6. Run **sudo groupadd it**
`Creates a second group called it.`

<p align="center">
  Image 27
</p>

7. Run **sudo usermod -aG finance johnsmith
`Adds johnsmith to the finance group (-aG appends to existing groups rather than overwriting them).`
8. Run **sudo usermod -aG it janedoe
`Adds janedoe to the finance group.`

<p align="center">
  Image 28
</p>

9. Run **groups johnsmith**
`Confirms which groups johnsmith belongs to.`
10. Run **groups janedoe**
`Confirms which groups janedoe belongs to.`

<p align="center">
  Image 29
</p>

11. Run **cat /etc/passwd | grep -E "johnsmith|janedoe"
`Uses grep to filter the full user database down to just the two new accounts, showing their UID, GID, home directory, and shell.`

<p align="center">
  Image 30
</p>

12. Run **cat /etc/group | grep -E "finance|it"**
`Uses grep to filter the group database down to just the two new groups and confirm membership.`
13. Run **cat /etc/group | grep -E "^(finance|it):"
`Refines the earlier grep command by anchoring the pattern to the start of the line and requiring a colon right after, so only the actual finance and it group entries match — filtering out johnsmith, which got pulled in previously because "it" appears inside "smith."`

<p align="center">
  Image 31
</p>

14. Run **clear**

---

### 6) File Permissions & Ownership

1. Run **sudo mkdir /shared**
`Creates a shared directory that both johnsmith and janedoe will need access to.`

<p align="center">
  Image 32
</p>

2. Run **sudo chown root:finance /shared**
`Sets the directory's group ownership to finance, meaning members of that group get the group-level permissions defined below.`
3. Run **sudo chmod 770 /shared**
`Sets permissions so the owner (root) and group (finance) have full read/write/execute access, while everyone else has none.`

<p align="center">
  Image 33
</p>

4. Run **ls -la /shared**
`Confirms the directory's permissions, ownership, and group ownership were applied correctly.`

<p align="center">
  Image 34
</p>

5. Run **sudo -u johnsmith touch /shared/test.txt**
`Simulates johnsmith (a member of finance) creating a file inside /shared — should succeed since he's in the group with access.`
6. Run **sudo -u janedoe touch /shared/test2.txt**
`stgfsdgsfdgsdfgs`

<p align="center">
  Image 35
</p>

7. Run **sudo ls -la /shared**
`Shows the resulting directory contents, confirming johnsmith's file exists and janedoe's attempt didn't create anything.`

<p align="center">
  Image 36
</p>

8. Run **sudo -u johnsmith chmod +x /shared/test.txt** then **sudo -u johnsmith ls -la /shared/test.txt**
`Adds execute permission to the file and confirms the change using symbolic notation, as an alternative to the numeric (octal) method used earlier.`

<p align="center">
  Image 37
</p>

9. Run **clear**

---

### 7) Package Management & Software

1. Run **sudo apt update**
`Refreshes the local package index so apt knows about the latest available versions before installing anything.`

<p align="center">
  Image 38
</p>

2. Run **sudo apt install nginx -y**
`Installs the nginx web server package and its dependencies.`

<p align="center">
  Image 39
</p>

3. Run **sudo systemctl status nginx**
`Confirms nginx installed successfully and is running as an active service.`

<p align="center">
  Image 40
</p>

4. Run **curl localhost**
`Sends a local request to the web server and confirms it responds with the default nginx welcome page HTML.`

<p align="center">
  Image 41
</p>

5. Run **apt list --installed | grep nginx**
`Uses grep to filter the full list of installed packages down to just the nginx-related entries, confirming it's present.`

<p align="center">
  Image 42
</p>

6. Run **clear**

---

### 8) Process & Resource Management

1. Run **ps aux | head**
`Lists currently running processes with details like user, CPU/memory usage, and command, showing the first several entries.`

<p align="center">
  Image 43
</p>

2. Run **ps aux | grep nginx**
`Uses grep to filter the full process list down to just the nginx worker/master processes, confirming they're running`

<p align="center">
  Image 44
</p>

3. Run **top**
`Opens an interactive, real-time view of system resource usage — processes, CPU, memory — updating live. Press q to exit.`
REDO THIS ONE IT HAS THE HYPHENS IN IT

<p align="center">
  Image 45
</p>

4. Run **ps aux --sort=-%mem | head -5**
`Sorts all processes by memory usage, highest first, and shows the top 5 — simulating the "find what's eating memory" step in a slow-server scenario.`

<p align="center">
  Image 46
</p>

5. Run **df -h**
`Shows disk space usage across all mounted filesystems in human-readable format.`

<p align="center">
  Image 47
</p>

6. Run **sudo du -sh /var/log**
`Shows the total size of the /var/log directory, a common place to check when disk space runs low.`

<p align="center">
  Image 48
</p>

7. Run **sleep 300 &**
`Starts a background process that does nothing for 300 seconds, giving you a safe, harmless process to practice killing.`
8. Run **ps aux | grep sleep**
`Uses grep to find the PID (process ID) of the sleep process you just started.`

<p align="center">
  Image 49
</p>

9. Run **kill <PID>**
`Terminates the sleep process using its PID, sending the default termination signal to stop it.`
10. Run **ps aux | grep sleep**
`Confirms the process no longer appears in the list, showing the kill was successful. Only the grep command itself should show up this time, since its own search pattern contains the word "sleep."`

<p align="center">
  Image 50
</p>

11. Run **clear**

---

### 9) Basic Networking & Troubleshooting

1. Run **ip a**
`Displays network interface information, including the VM's internal IP address, confirming basic network configuration.`

<p align="center">
  Image 51
</p>

2. Run **ping -c 4 google.com**
`Sends 4 test packets to google.com to confirm outbound internet connectivity and basic DNS resolution.`

<p align="center">
  Image 52
</p>

3. Run **sudo ss -tuln**
`Lists all listening TCP/UDP ports on the system, showing which services are accepting connections.`

<p align="center">
  Image 53
</p>

4. Run **sudo ss -tuln | grep :80**
`Uses grep to filter the port listing down to just port 80, confirming nginx is actively listening for web traffic.`

<p align="center">
  Image 54
</p>

5. Run **cat /etc/hosts**
`Displays the local hostname resolution file, showing how the system maps hostnames to IP addresses before checking external DNS.`

<p align="center">
  Image 55
</p>

6. Run **sudo ufw status**
`Checks whether the firewall is active and what rules are currently configured.`

<p align="center">
  Image 56
</p>

7. Run **sudo ufw allow 22/tcp** then **sudo ufw allow 80/tcp**
`Explicitly allows SSH (22) and HTTP (80) traffic through the firewall.`

<p align="center">
  Image 57
</p>

8. Run **sudo ufw enable**
`Activates the firewall with the rules just configured. You'll be prompted to confirm since this could disconnect an active SSH session if port 22 wasn't already allowed.`

<p align="center">
  Image 58
</p>

9. Run **sudo ufw status**
`Confirms the firewall is now active and lists the allowed ports.`

<p align="center">
  Image 59
</p>

10. Run **sudo grep "Failed Password" /var/log/auth.log**
`Searches the authentication log for any failed SSH login attempts, a common first step when investigating unauthorized access attempts.`

<p align="center">
  Image 60
</p>

11. Run **sudo apt install traceroute -y** then **traceroute google.com**
`Shows the network path that traffic takes to reach an external destination, useful for diagnosing where a connection is slowing down or failing.`

<p align="center">
  Image 61
</p>

12. Run **clear**

---

### 10) Shell Scripting Basics

1. Run **nano create_user.sh**
`Opens the nano text editor to create a new script file.`
2. Press **Ctrl+O** then paste the following script then **Enter** then **Ctrl+X**

<p align="center">
  Image 62
</p>

3. Run **chmod +x create_user.sh**
`Makes the script executable.`

<p align="center">
  Image 63
</p>

4. Run **./create_user.sh bobjones it**
`Runs the script to create a new user, bobjones, and add him to the it group — this doubles as adding a fourth employee to your fictional company.`

<p align="center">
  Image 64
</p>

5. Run **./create_user.sh bobjones it** again
`Runs the script a second time with the same arguments, demonstrating the "already exists" check working correctly instead of erroring out or creating a duplicate.`

<p align="center">
  Image 65
</p>

6. Run **./create_user.sh**
`Demonstrates the usage/error message that prints when required arguments are missing.`

<p align="center">
  Image 66
</p>

7. Run **cat user_creation.log**
`Displays the full log file, showing every action the script has taken so far.`

<p align="center">
  Image 67
</p>

8. Run **grep "Created" user_creation.log**
`Uses grep to filter the log down to just successful user creation events, ignoring any skipped/duplicate attempts.`

<p align="center">
  Image 68
</p>

9. Run **groups bobjones**
`Confirms bobjones was actually created and added to the correct group, verifying the script's work outside the log file itself.`

<p align="center">
  Image 69
</p>

10. Run **clear**
