#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Run as root to access all stats."
  exit 1
fi

echo "--------------------------"
echo " Server Performance Stats"
echo "--------------------------"

# CPU Usage
echo "Total CPU Usage:"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | \
awk '{print 100 - $8 "%"}')
echo "CPU Usage: $cpu_usage"

# Memory Usage
echo ""
echo "Memory Usage:"
free_output=$(free -m)
total_mem=$(echo "$free_output" | awk '/Mem/ {print $2}')
used_mem=$(echo "$free_output" | awk '/Mem/ {print $3}')
free_mem=$(echo "$free_output" | awk '/Mem/ {print $4}')
mem_percentage=$(( used_mem * 100 / total_mem ))
echo "Total: ${total_mem}MB"
echo "Used: ${used_mem}MB"
echo "Free: ${free_mem}MB"
echo "Memory Usage: $mem_percentage%"

# Disk Usage
echo ""
echo "Disk Usage:"
disk_usage=$(df -h --total | grep 'total' | awk '{print $3 " used / " $2 " total (" $5 " used)"}')
echo "$disk_usage"

# Top 5 Processes by CPU Usage
echo ""
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
echo ""
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6

echo ""
echo "--------------------------"
echo " Additional System Stats"
echo "--------------------------"

# OS Version
echo "OS Version: $(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2)"

# Uptime
echo "Uptime: $(uptime -p)"

# Load Average
echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"

# Logged in Users
echo "Logged in Users: $(who | wc -l)"

# Failed Login Attempts
echo "Failed Login Attempts:"
awk '$0 ~ /Failed password/ {print $0}' /var/log/auth.log 2>/dev/null | wc -l || echo "Log not accessible."

echo ""
echo "Script execution completed."
