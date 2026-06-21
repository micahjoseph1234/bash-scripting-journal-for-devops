# Ultimate Bash Scripting Cheat Sheet

## DevOps Interview Revision Guide

---

# 1. Script Structure

```bash
#!/bin/bash
```

Always place at the top of every script.

---

# 2. Variables

## Declaration

```bash
name="Micah"
```

No spaces around `=`.

---

## Access Variable

```bash
echo "$name"
```

---

# 3. User Input

```bash
read -p "Enter Username: " username
```

---

# 4. Comments

```bash
# Single Line Comment
```

---

# 5. Conditional Statements

## Basic If Else

```bash
if [ condition ]
then
    commands
else
    commands
fi
```

---

# 6. Exit Codes

## Last Command Status

```bash
$?
```

### Meaning

```text
0      → Success
Non-0  → Failure
```

---

## Example

```bash
mkdir test

if [ $? -eq 0 ]
then
    echo "Success"
fi
```

---

# 7. Comparison Operators

## Numeric

| Operator | Meaning            |
| -------- | ------------------ |
| -eq      | Equal              |
| -ne      | Not Equal          |
| -gt      | Greater Than       |
| -lt      | Less Than          |
| -ge      | Greater Than Equal |
| -le      | Less Than Equal    |

Example:

```bash
if [ "$age" -ge 18 ]
```

---

# 8. File Tests

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

## File Not Empty

```bash
[ -s filename ]
```

---

# 9. Command Substitution

Store command output.

```bash
today=$(date)
```

---

## Examples

```bash
disk=$(df -h / | awk 'NR==2 {print $5}')
```

```bash
errors=$(grep -c ERROR app.log)
```

---

# 10. Arithmetic Expansion

```bash
sum=$((10 + 20))
```

---

## Example

```bash
usage=$(( used * 100 / total ))
```

---

# 11. Functions

## Function Definition

```bash
check_service() {
    echo "Checking"
}
```

---

## Function Call

```bash
check_service
```

---

# 12. Loops

## For Loop

```bash
for item in a b c
do
    echo "$item"
done
```

---

## Java Equivalent

```java
for(String item : items)
```

---

## While Loop

```bash
while true
do
    commands
done
```

---

## Polling Pattern

```bash
while true
do
    systemctl is-active nginx
    sleep 10
done
```

---

# 13. Sleep

Pause script.

```bash
sleep 10
```

Waits 10 seconds.

---

# 14. Exit

```bash
exit 0
```

Success.

---

```bash
exit 1
```

Failure.

---

# 15. Linux User Management

## Create User

```bash
useradd username
```

---

## Create User With Home

```bash
useradd -m username
```

---

## Delete User

```bash
userdel username
```

---

## Check User Exists

```bash
id username
```

---

# 16. Group Management

## Create Group

```bash
groupadd developers
```

---

## Add User To Group

```bash
usermod -aG developers username
```

---

## Verify Group

```bash
grep developers /etc/group
```

---

# 17. Package Validation

## Check Package Installed

```bash
command -v git
```

---

## Silent Check

```bash
command -v git >/dev/null 2>&1
```

---

# 18. Output Redirection

## Standard Output

```bash
>
```

---

## Append

```bash
>>
```

---

## Error Output

```bash
2>
```

---

## Discard Output

```bash
>/dev/null
```

---

## Discard Errors

```bash
2>/dev/null
```

---

## Discard Both

```bash
>/dev/null 2>&1
```

---

# 19. File Operations

## Copy

```bash
cp source destination
```

---

## Move

```bash
mv source destination
```

---

## Remove

```bash
rm file
```

---

## Create Directory

```bash
mkdir dirname
```

---

# 20. Date Command

## Current Date

```bash
date
```

---

## Timestamp

```bash
date +%Y%m%d_%H%M
```

Example:

```text
20260621_1800
```

---

# 21. Find Command

## Find Old Files

```bash
find /logs -type f -mtime +30
```

---

## Delete Old Files

```bash
find /logs -type f -mtime +30 -delete
```

---

# 22. Service Management

## Service Status

```bash
systemctl status nginx
```

---

## Check Running

```bash
systemctl is-active nginx
```

---

## Quiet Check

```bash
systemctl is-active --quiet nginx
```

---

## Start Service

```bash
systemctl start nginx
```

---

## Stop Service

```bash
systemctl stop nginx
```

---

## Restart Service

```bash
systemctl restart nginx
```

---

## Enable At Boot

```bash
systemctl enable nginx
```

---

# 23. Log Analysis

## Search Text

```bash
grep ERROR app.log
```

---

## Count Matches

```bash
grep -c ERROR app.log
```

---

## Ignore Case

```bash
grep -i error app.log
```

---

## Exclude Pattern

```bash
grep -v INFO app.log
```

---

# 24. head

First lines.

```bash
head app.log
```

---

```bash
head -n 20 app.log
```

---

# 25. tail

Latest lines.

```bash
tail app.log
```

---

```bash
tail -n 20 app.log
```

---

# 26. wc

## Count Lines

```bash
wc -l app.log
```

---

## Count Words

```bash
wc -w app.log
```

---

## Count Characters

```bash
wc -c app.log
```

---

# 27. sort

```bash
sort app.log
```

---

# 28. uniq

Remove duplicates.

```bash
sort app.log | uniq
```

---

# 29. uniq -c

Count duplicates.

```bash
sort app.log | uniq -c
```

---

# 30. AWK

Column Processing Tool.

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
```

---

## Print Column

```bash
awk '{print $5}'
```

---

## Print Second Line

```bash
awk 'NR==2'
```

---

# 31. TR

Text Processing Utility.

## Delete %

```bash
tr -d '%'
```

---

## Delete Spaces

```bash
tr -d ' '
```

---

## Lower To Upper

```bash
tr 'a-z' 'A-Z'
```

---

## Upper To Lower

```bash
tr 'A-Z' 'a-z'
```

---

# 32. Disk Monitoring

## Check Disk

```bash
df -h
```

---

## Root Filesystem

```bash
df -h /
```

---

# 33. Memory Monitoring

## RAM Usage

```bash
free -m
```

---

# 34. Cron Jobs

## View

```bash
crontab -l
```

---

## Edit

```bash
crontab -e
```

---

## Every Minute

```bash
* * * * *
```

---

## Every 5 Minutes

```bash
*/5 * * * *
```

---

## Daily 2 AM

```bash
0 2 * * *
```

---

## Sunday 2 AM

```bash
0 2 * * 0
```

---

# 35. Process Management

## View Processes

```bash
ps -ef
```

---

## Find Process

```bash
pgrep nginx
```

---

## Graceful Kill

```bash
kill PID
```

---

## Force Kill

```bash
kill -9 PID
```

---

# Top 10 Bash Interview Questions

1. Difference between `$()` and `$(( ))`
2. Purpose of `$?`
3. Difference between `kill` and `kill -9`
4. Difference between `grep`, `awk`, and `sed`
5. How to check service status in Bash?
6. How to schedule scripts using Cron?
7. How to monitor disk usage?
8. How to monitor memory usage?
9. What is `/dev/null`?
10. Explain a real Bash automation script you have written.

---

# Final DevOps Bash Checklist

```text
✓ Variables
✓ User Input
✓ Conditions
✓ Exit Codes
✓ Functions
✓ For Loop
✓ While Loop
✓ User Management
✓ Group Management
✓ Package Validation
✓ File Management
✓ Service Management
✓ Health Monitoring
✓ Log Analysis
✓ AWK
✓ TR
✓ Cron Jobs
✓ Process Management
✓ DevOps Utility Scripts
```
