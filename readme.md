# Server Performance Stats

This project provides a Bash script to analyze any Linux server performance stats, including CPU, memory, and disk usage, as well as the top processes consuming resources.

## Features

- **CPU Usage**: Displays total CPU usage percentage.
- **Memory Usage**: Shows used, free, and total memory, along with the usage percentage.
- **Disk Usage**: Displays used and total disk space with the percentage used.
- **Top Processes by CPU and Memory**: Lists the top 5 processes consuming the most CPU and memory.
- **Additional Stats**: 
  - OS version
  - System uptime
  - Load average
  - Logged-in users
  - Failed login attempts (if available)

## Prerequisites

- **Linux-based OS**
- Bash shell (`/bin/bash`)
- Root privileges

## Usage

1. **Clone the repository:**

    Just clone the repository in your folder of choice and enter to the folder:
    
   ```bash
   git clone https://github.com/brandonmdz/server-performance-stats.git
   cd server-performance-stats

2. **Make the script executable:**

   ```bash
   chmod +x server-stats.sh

3. **Run the script:**

	```bash
   ./server-stats.sh

## Example output:

   ```bash
--------------------------
 Server Performance Stats
--------------------------
Total CPU Usage:
CPU Usage: 33.3%

Memory Usage:
Total: 3717MB
Used: 1011MB
Free: 2467MB
Memory Usage: 27%

Disk Usage:
5.9G used / 63G total (10% used)

Top 5 Processes by CPU Usage:
    PID    PPID CMD                         %MEM %CPU
   1930    1911 ps -eo pid,ppid,cmd,%mem,%c  0.1  300
    698     662 /usr/bin/gnome-shell         5.8  0.2
   1781       1 /usr/libexec/fwupd/fwupd     3.2  0.0
   1873       2 [kworker/1:2-events]         0.0  0.0
   1868       2 [kworker/1:0-events_freezab  0.0  0.0

Top 5 Processes by Memory Usage:
    PID    PPID CMD                         %MEM %CPU
    698     662 /usr/bin/gnome-shell         5.8  0.2
   1781       1 /usr/libexec/fwupd/fwupd     3.2  0.0
   1023       1 /usr/libexec/ibus-x11 --kil  1.9  0.0
    727     698 /usr/bin/Xwayland :1024 -ro  1.7  0.0
   1143    1067 /usr/libexec/tracker-miner-  1.5  0.0

--------------------------
 Additional System Stats
--------------------------
OS Version: "Debian GNU/Linux 12 (bookworm)"
Uptime: up 3 hours, 21 minutes
Load Average:  0.10, 0.03, 0.01
Logged in Users: 1
Failed Login Attempts:
0
```

## Project URL:

This project is one of the many DevOps projects shared by [roadmap.sh](http://roadmap.sh "roadmap.sh"). You can visit this project from the following [URL](https://roadmap.sh/projects/server-stats "URL").
