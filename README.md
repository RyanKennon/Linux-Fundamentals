# Linux-Fundamentals

### 1) Environment Setup

1. Open **Microsoft Azure** then search **Resource Groups** and select **Create** then give the **Resource Group** the following settings then create the **Resource Group**
   - **Name:** RG-01
   - **Region:** South Central US
  
<p align="center">
  <img src="Images/Image 1.png">
</p>

2. Search **Virtual Network** and select **Create** then give the **Virtual Network** the following settings then create the **Virtual Network**
   - **Resource Group:** RG-01
   - **Name:** VNet-01
   - **Region:** South Central US
  
<p align="center">
  <img src="Images/Image 2.png">
</p>

3. Search **Virtual Machines** then **Create** then give the **Virtual Machine** the following settings then create the **Virtual Machine**
   - **Basics**
     - **Resource Group:** RG-01
     - **Name:** Linux-VM
     - **Image:** Ubuntu Server 22.04 LTS
     - **Size:** 2 vcpus
     - **Username:** userryan
   - **Networking**
     - **Virtual Network:** VNet-01
    
<p align="center">
  <img src="Images/Image 3.png"><br>
  <img src="Images/Image 4.png">
</p>

---

### 2) Basic System Orientation

1. Connect to the **Virtual Machine** using the following **Placeholder Value** (replace the path and IP with your own values)<br>
`ssh -i "path/to/your-key.pem" username@your-vm-public-ip`

<p align="center">
  <img src="Images/Image 5.png">
</p>

2. Run **clear**<br>
`Clears the terminal screen, giving a clean starting point before moving into the next set of commands.`

<p align="center">
  <img src="Images/Image 5.5.PNG">
</p>

3. Run **pwd**<br>
`Displays the current working directory, confirming you're in /home/userryan right after logging in.`

<p align="center">
  <img src="Images/Image 6.PNG">
</p>

4. Run **whoami**<br>
`Confirms the currently logged-in user account.`

<p align="center">
  <img src="Images/Image 7.PNG">
</p>

5. Run **id**<br>
`Shows your user ID (UID), group ID (GID), and all groups you belong to.`

<p align="center">
  <img src="Images/Image 8.PNG">
</p>

6. Run **uname -a**<br>
`Prints kernel name, version, and system architecture.`

<p align="center">
  <img src="Images/Image 9.PNG">
</p>

7. Run **cat /etc/os-release**<br>
`Displays the Linux distribution name and version details.`

<p align="center">
  <img src="Images/Image 10.PNG">
</p>

8. Run **grep -i ubuntu /etc/os-release**<br>
`Uses grep to filter the os-release output down to just the lines mentioning "ubuntu," highlighting the matches — a quick way to confirm the distro without reading the full file.`

<p align="center">
  <img src="Images/Image 11.PNG">
</p>

---

### 3) Filesystem Hierarchy Exploration

1. Run **ls -la /**<br>
`Lists all top-level directories in the Linux filesystem, including hidden ones, along with permissions, ownership, and size details.`

<p align="center">
  <img src="Images/Image 12.PNG">
</p>

2. Run **cd /etc** then **ls -la**<br>
`Navigates into /etc, the directory holding system-wide configuration files, and lists its contents.`

<p align="center">
  <img src="Images/Image 13.PNG">
</p>

3. Run **cd -** to return to the previous directory
4. Run **cd /var** then **ls -la**<br>
`Navigates into /var, the directory holding variable data such as logs and caches, and lists its contents.`

<p align="center">
  <img src="Images/Image 14.PNG">
</p>

5. Run **cd -** to return to the previous directory
6. Run **cd /tmp** then **ls -la**<br>
`Navigates into /tmp, the directory used for temporary files that are cleared on reboot, and lists its contents.`

<p align="center">
  <img src="Images/Image 15.PNG">
</p>

7. Run **cd -** to return to the previous directory then run **clear**

---

### 4) Navigation, Search & Getting Help

1. Run **find /etc -name "*.conf" | head**<br>
`Searches the /etc directory for files ending in .conf, piping the results to head to show just the first several matches.`

<p align="center">
  <img src="Images/Image 16.PNG">
</p>

2. Run **sudo apt install mlocate**<br>
`Installs the mlocate package, which provides the locate command`

<p align="center">
  <img src="Images/Image 17.PNG">
</p>

3. Run **sudo updatedb**<br>
`Builds the database that locate searches against, indexing the filesystem.`

<p align="center">
  <img src="Images/Image 18.PNG">
</p>

4. Run **locate password**<br>
`Searches the indexed database for any file with "passwd" in its name or path, demonstrating how locate differs from find (instant lookup vs. live filesystem search).`

<p align="center">
  <img src="Images/Image 19.PNG">
</p>

5. Run **which bash**<br>
`Shows the full path to the bash executable.`

<p align="center">
  <img src="Images/Image 20.PNG">
</p>

6. Run **which ssh**<br>
`Shows the full path to the ssh executable.`

<p align="center">
  <img src="Images/Image 21.PNG">
</p>

7. Run **man ls**<br>
`Opens the manual page for ls, showing full documentation including all available options. Press q to exit.`

<p align="center">
  <img src="Images/Image 22.PNG">
</p>

8. Run **ls --help**<br>
`Displays a quick built-in summary of ls options, faster to reference than the full man page.`

<p align="center">
  <img src="Images/Image 23.PNG">
</p>

9. Run **apropos user**<br>
`Searches all man page descriptions for the keyword "user," useful for discovering commands when you don't know the exact name you're looking for.`

<p align="center">
   <img src="Images/Image 24.PNG">
</p>

10. Run **clear**

---

### 5) User & Group Management

1. Run **sudo useradd -m -c "John Smith" johnsmith**<br>
`Creates a new user named johnsmith with a home directory (-m) and a comment field storing the full name.`
2. Run **sudo passwd johnsmith**<br>
`Sets a password for the new user. You'll be prompted to type and confirm it.`

<p align="center">
   <img src="Images/Image 25.PNG">
</p>

3. Run **sudo useradd -m -c "Jane Doe" janedoe**<br>
`Creates a second user, janedoe, following the same pattern.`
4. Run **sudo passwd janedoe**<br>
`Sets a password for janedoe.`

<p align="center">
   <img src="Images/Image 26.PNG">
</p>

5. Run **sudo groupadd finance**<br>
`Creates a new group called finance.`
6. Run **sudo groupadd it**<br>
`Creates a second group called it.`

<p align="center">
   <img src="Images/Image 27.PNG">
</p>

7. Run **sudo usermod -aG finance johnsmith<br>
`Adds johnsmith to the finance group (-aG appends to existing groups rather than overwriting them).`
8. Run **sudo usermod -aG it janedoe<br>
`Adds janedoe to the finance group.`

<p align="center">
   <img src="Images/Image 28.PNG">
</p>

9. Run **groups johnsmith**<br>
`Confirms which groups johnsmith belongs to.`
10. Run **groups janedoe**<br>
`Confirms which groups janedoe belongs to.`

<p align="center">
   <img src="Images/Image 29.PNG">
</p>

11. Run **cat /etc/passwd | grep -E "johnsmith|janedoe"<br>
`Uses grep to filter the full user database down to just the two new accounts, showing their UID, GID, home directory, and shell.`

<p align="center">
   <img src="Images/Image 30.PNG">
</p>

12. Run **cat /etc/group | grep -E "finance|it"**<br>
`Uses grep to filter the group database down to just the two new groups and confirm membership.`
13. Run **cat /etc/group | grep -E "^(finance|it):"<br>
`Refines the earlier grep command by anchoring the pattern to the start of the line and requiring a colon right after, so only the actual finance and it group entries match — filtering out johnsmith, which got pulled in previously because "it" appears inside "smith."`

<p align="center">
   <img src="Images/Image 31.PNG">
</p>

14. Run **clear**

---

### 6) File Permissions & Ownership

1. Run **sudo mkdir /shared**<br>
`Creates a shared directory that both johnsmith and janedoe will need access to.`

<p align="center">
   <img src="Images/Image 32.PNG">
</p>

2. Run **sudo chown root:finance /shared**<br>
`Sets the directory's group ownership to finance, meaning members of that group get the group-level permissions defined below.`
3. Run **sudo chmod 770 /shared**<br>
`Sets permissions so the owner (root) and group (finance) have full read/write/execute access, while everyone else has none.`

<p align="center">
   <img src="Images/Image 33.PNG">
</p>

4. Run **ls -la /shared**<br>
`Confirms the directory's permissions, ownership, and group ownership were applied correctly.`

<p align="center">
   <img src="Images/Image 34.PNG">
</p>

5. Run **sudo -u johnsmith touch /shared/test.txt**<br>
`Simulates johnsmith (a member of finance) creating a file inside /shared — should succeed since he's in the group with access.`
6. Run **sudo -u janedoe touch /shared/test2.txt**<br>
`stgfsdgsfdgsdfgs`

<p align="center">
   <img src="Images/Image 35.PNG">
</p>

7. Run **sudo ls -la /shared**<br>
`Shows the resulting directory contents, confirming johnsmith's file exists and janedoe's attempt didn't create anything.`

<p align="center">
   <img src="Images/Image 36.PNG">
</p>

8. Run **sudo -u johnsmith chmod +x /shared/test.txt** then **sudo -u johnsmith ls -la /shared/test.txt**<br>
`Adds execute permission to the file and confirms the change using symbolic notation, as an alternative to the numeric (octal) method used earlier.`

<p align="center">
   <img src="Images/Image 37.PNG">
</p>

9. Run **clear**

---

### 7) Package Management & Software

1. Run **sudo apt update**<br>
`Refreshes the local package index so apt knows about the latest available versions before installing anything.`

<p align="center">
   <img src="Images/Image 38.PNG">
</p>

2. Run **sudo apt install nginx -y**<br>
`Installs the nginx web server package and its dependencies.`

<p align="center">
   <img src="Images/Image 39.PNG">
</p>

3. Run **sudo systemctl status nginx**<br>
`Confirms nginx installed successfully and is running as an active service.`

<p align="center">
   <img src="Images/Image 40.PNG">
</p>

4. Run **curl localhost**<br>
`Sends a local request to the web server and confirms it responds with the default nginx welcome page HTML.`

<p align="center">
   <img src="Images/Image 41.PNG">
</p>

5. Run **apt list --installed | grep nginx**<br>
`Uses grep to filter the full list of installed packages down to just the nginx-related entries, confirming it's present.`

<p align="center">
   <img src="Images/Image 42.PNG">
</p>

6. Run **clear**

---

### 8) Process & Resource Management

1. Run **ps aux | head**<br>
`Lists currently running processes with details like user, CPU/memory usage, and command, showing the first several entries.`

<p align="center">
   <img src="Images/Image 43.PNG">
</p>

2. Run **ps aux | grep nginx**<br>
`Uses grep to filter the full process list down to just the nginx worker/master processes, confirming they're running`

<p align="center">
   <img src="Images/Image 44.PNG">
</p>

3. Run **top**<br>
`Opens an interactive, real-time view of system resource usage — processes, CPU, memory — updating live. Press q to exit.`
REDO THIS ONE IT HAS THE HYPHENS IN IT

<p align="center">
   <img src="Images/Image 45.PNG">
</p>

4. Run **ps aux --sort=-%mem | head -5**<br>
`Sorts all processes by memory usage, highest first, and shows the top 5 — simulating the "find what's eating memory" step in a slow-server scenario.`

<p align="center">
   <img src="Images/Image 46.PNG">
</p>

5. Run **df -h**<br>
`Shows disk space usage across all mounted filesystems in human-readable format.`

<p align="center">
   <img src="Images/Image 47.PNG">
</p>

6. Run **sudo du -sh /var/log**<br>
`Shows the total size of the /var/log directory, a common place to check when disk space runs low.`

<p align="center">
   <img src="Images/Image 48.PNG">
</p>

7. Run **sleep 300 &**<br>
`Starts a background process that does nothing for 300 seconds, giving you a safe, harmless process to practice killing.`
8. Run **ps aux | grep sleep**<br>
`Uses grep to find the PID (process ID) of the sleep process you just started.`

<p align="center">
   <img src="Images/Image 49.PNG">
</p>

9. Run **kill <PID>**<br>
`Terminates the sleep process using its PID, sending the default termination signal to stop it.`
10. Run **ps aux | grep sleep**<br>
`Confirms the process no longer appears in the list, showing the kill was successful. Only the grep command itself should show up this time, since its own search pattern contains the word "sleep."`

<p align="center">
   <img src="Images/Image 50.PNG">
</p>

11. Run **clear**

---

### 9) Basic Networking & Troubleshooting

1. Run **ip a**<br>
`Displays network interface information, including the VM's internal IP address, confirming basic network configuration.`

<p align="center">
   <img src="Images/Image 51.PNG">
</p>

2. Run **ping -c 4 google.com**<br>
`Sends 4 test packets to google.com to confirm outbound internet connectivity and basic DNS resolution.`

<p align="center">
   <img src="Images/Image 52.PNG">
</p>

3. Run **sudo ss -tuln**<br>
`Lists all listening TCP/UDP ports on the system, showing which services are accepting connections.`

<p align="center">
   <img src="Images/Image 53.PNG">
</p>

4. Run **sudo ss -tuln | grep :80**<br>
`Uses grep to filter the port listing down to just port 80, confirming nginx is actively listening for web traffic.`

<p align="center">
   <img src="Images/Image 54.PNG">
</p>

5. Run **cat /etc/hosts**<br>
`Displays the local hostname resolution file, showing how the system maps hostnames to IP addresses before checking external DNS.`

<p align="center">
   <img src="Images/Image 55.PNG">
</p>

6. Run **sudo ufw status**<br>
`Checks whether the firewall is active and what rules are currently configured.`

<p align="center">
   <img src="Images/Image 56.PNG">
</p>

7. Run **sudo ufw allow 22/tcp** then **sudo ufw allow 80/tcp**<br>
`Explicitly allows SSH (22) and HTTP (80) traffic through the firewall.`

<p align="center">
   <img src="Images/Image 57.PNG">
</p>

8. Run **sudo ufw enable**<br>
`Activates the firewall with the rules just configured. You'll be prompted to confirm since this could disconnect an active SSH session if port 22 wasn't already allowed.`

<p align="center">
   <img src="Images/Image 58.PNG">
</p>

9. Run **sudo ufw status**<br>
`Confirms the firewall is now active and lists the allowed ports.`

<p align="center">
   <img src="Images/Image 59.PNG">
</p>

10. Run **sudo grep "Failed Password" /var/log/auth.log**<br>
`Searches the authentication log for any failed SSH login attempts, a common first step when investigating unauthorized access attempts.`

<p align="center">
   <img src="Images/Image 60.PNG">
</p>

11. Run **sudo apt install traceroute -y** then **traceroute google.com**<br>
`Shows the network path that traffic takes to reach an external destination, useful for diagnosing where a connection is slowing down or failing.`

<p align="center">
   <img src="Images/Image 61.PNG">
</p>

12. Run **clear**

---

### 10) Shell Scripting Basics

1. Run **nano create_user.sh**<br>
`Opens the nano text editor to create a new script file.`
2. Press **Ctrl+O** then paste the [create_user.sh](scripts/create_user.sh). script then **Enter** then **Ctrl+X**

<p align="center">
   <img src="Images/Image 62.PNG">
</p>

3. Run **chmod +x create_user.sh**<br>
`Makes the script executable.`

<p align="center">
   <img src="Images/Image 63.PNG">
</p>

4. Run **./create_user.sh bobjones it**<br>
`Runs the script to create a new user, bobjones, and add him to the it group — this doubles as adding a fourth employee to your fictional company.`

<p align="center">
   <img src="Images/Image 64.PNG">
</p>

5. Run **./create_user.sh bobjones it** again<br>
`Runs the script a second time with the same arguments, demonstrating the "already exists" check working correctly instead of erroring out or creating a duplicate.`

<p align="center">
   <img src="Images/Image 65.PNG">
</p>

6. Run **./create_user.sh**<br>
`Demonstrates the usage/error message that prints when required arguments are missing.`

<p align="center">
   <img src="Images/Image 66.PNG">
</p>

7. Run **cat user_creation.log**<br>
`Displays the full log file, showing every action the script has taken so far.`

<p align="center">
   <img src="Images/Image 67.PNG">
</p>

8. Run **grep "Created" user_creation.log**<br>
`Uses grep to filter the log down to just successful user creation events, ignoring any skipped/duplicate attempts.`

<p align="center">
   <img src="Images/Image 68.PNG">
</p>

9. Run **groups bobjones**<br>
`Confirms bobjones was actually created and added to the correct group, verifying the script's work outside the log file itself.`

<p align="center">
   <img src="Images/Image 69.PNG">
</p>

10. Run **clear**
