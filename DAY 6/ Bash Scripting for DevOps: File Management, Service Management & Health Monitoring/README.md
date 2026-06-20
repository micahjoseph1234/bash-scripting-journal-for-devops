# Day 5 - Linux & Bash Scripting for DevOps

## Overview

Today focused on practical Bash scripting used in real DevOps environments. The goal was to automate common operational tasks involving file management, service management, and health monitoring.

---

# Concepts Learned

## Bash Fundamentals

### Reading User Input

```bash
read -p "Enter filename: " filename
```

### Conditional Statements

```bash
if [ condition ]
then
    commands
else
    commands
fi
```

### Exit Status

```bash
$?
```

* `0` → Success
* Non-zero → Failure

Example:

```bash
mkdir testdir

if [ $? -eq 0 ]
then
    echo "Success"
fi
```

### Functions

Function Definition:

```bash
check_service() {
    echo "Checking Service"
}
```

Function Call:

```bash
check_service
```

### Variables

```bash
name="Micah"
```

No spaces around `=`.

### Command Substitution

Store output of commands:

```bash
today=$(date)
```

### Arithmetic Expansion

```bash
sum=$((10 + 20))
```

---

# File Management

## File Existence Check

```bash
-f
```

Example:

```bash
if [ -f "$filename" ]
```

### Script

* file_exists.sh

---

## Directory Existence Check

```bash
-d
```

Example:

```bash
if [ -d "$dirname" ]
```

### Script

* directory_exists.sh

---

## Backup Automation

Concepts:

* cp
* date
* mkdir
* file validation

Timestamp:

```bash
timestamp=$(date +%Y%m%d_%H%M)
```

Copy File:

```bash
cp source destination
```

### Script

* backup_script.sh

---

## Log Cleanup

Find files older than 30 days:

```bash
find /path -type f -mtime +30
```

Delete:

```bash
find /path -type f -mtime +30 -delete
```

### Script

* log_cleanup.sh

---

# Service Management

## Check Service Status

```bash
systemctl status nginx
```

## Check if Service is Running

```bash
systemctl is-active nginx
```

Best for scripting:

```bash
systemctl is-active --quiet nginx
```

---

## Start Service

```bash
systemctl start nginx
```

---

## Restart Service

```bash
systemctl restart nginx
```

---

## Enable Service at Boot

```bash
systemctl enable nginx
```

---

## Scripts

* service_status.sh
* auto_start_service.sh
* auto_restart_service.sh
* service_health_report.sh

---

# Loops

## For Loop

```bash
for service in nginx ssh cron
do
    echo "$service"
done
```

Equivalent to Java enhanced for-loop.

Used for:

* Service Monitoring
* Server Monitoring
* Batch Operations

---

## While Loop

```bash
while true
do
    commands
done
```

Infinite loop.

Used for:

* Monitoring
* Polling
* Continuous Health Checks

Pause execution:

```bash
sleep 10
```

---

# Health Monitoring

## Service Health Polling

Concepts:

```bash
while true
do
    systemctl is-active --quiet nginx
    sleep 10
done
```

### Script

* health_check_polling.sh

---

## Disk Usage Monitoring

View Disk Usage:

```bash
df -h
```

Root Filesystem:

```bash
df -h /
```

Extract Usage:

```bash
df -h / | awk 'NR==2 {print $5}'
```

Remove Percentage Symbol:

```bash
tr -d '%'
```

### Numeric Comparisons

```bash
-ge
```

Means:

```text
Greater Than Or Equal
```

Comparison Operators:

| Operator | Meaning            |
| -------- | ------------------ |
| -eq      | Equal              |
| -ne      | Not Equal          |
| -gt      | Greater Than       |
| -lt      | Less Than          |
| -ge      | Greater Than Equal |
| -le      | Less Than Equal    |

### Script

* disk_usage_check.sh

---

## Memory Monitoring

Memory Information:

```bash
free -m
```

Extract Total Memory:

```bash
free -m | awk 'NR==2 {print $2}'
```

Extract Used Memory:

```bash
free -m | awk 'NR==2 {print $3}'
```

Calculate Usage Percentage:

```bash
usage=$(( used * 100 / total ))
```

### Script

* memory_check.sh

---

# AWK Basics

AWK treats each column as a field.

Example:

```text
/dev/root 6.8G 3.5G 3.3G 53% /
```

Fields:

```text
$1 = /dev/root
$2 = 6.8G
$3 = 3.5G
$4 = 3.3G
$5 = 53%
$6 = /
```

Print Fifth Column:

```bash
awk '{print $5}'
```

Print Second Line:

```bash
awk 'NR==2'
```

---

# TR Command

Used for text transformation.

Delete Characters:

```bash
tr -d '%'
```

Convert Lowercase to Uppercase:

```bash
tr 'a-z' 'A-Z'
```

Convert Uppercase to Lowercase:

```bash
tr 'A-Z' 'a-z'
```

---

# Linux Checks Cheat Sheet

## User Exists

```bash
id username
```

---

## Package Installed

```bash
command -v git
```

---

## File Exists

```bash
[ -f filename ]
```

---

## Directory Exists

```bash
[ -d dirname ]
```

---

## Service Running

```bash
systemctl is-active service
```

---

# Scripts Completed

1. file_exists.sh
2. directory_exists.sh
3. backup_script.sh
4. log_cleanup.sh
5. service_status.sh
6. auto_start_service.sh
7. auto_restart_service.sh
8. service_health_report.sh
9. health_check_polling.sh
10. disk_usage_check.sh
11. memory_check.sh

---

# Key Takeaways

* Learned Bash functions and scripting structure.
* Learned Linux file and directory validation.
* Learned backup automation.
* Learned log cleanup automation.
* Learned service monitoring and self-healing patterns.
* Learned polling using while loops.
* Learned disk and memory health monitoring.
* Learned text processing using awk and tr.
* Learned practical DevOps-style automation patterns.
