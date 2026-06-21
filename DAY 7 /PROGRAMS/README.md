# Real World Bash Scripting Assignments

---

# Lab 1 - Error Log Analyzer

## Problem Statement

Application team reports that the application is failing frequently.

As a DevOps Engineer, analyze the log file and generate a report showing:

* Total Errors
* Total Warnings
* Total Info Messages

---

## Solution

### File: error_log_analyzer.sh

```bash
#!/bin/bash

errors=$(grep -c ERROR app.log)

warnings=$(grep -c WARN app.log)

infos=$(grep -c INFO app.log)

echo "===== LOG ANALYSIS REPORT ====="

echo "Total Errors   : $errors"

echo "Total Warnings : $warnings"

echo "Total Info     : $infos"
```

---

## Skills Used

* grep
* grep -c
* Variables
* Command Substitution

---

# Lab 2 - Top Error Messages Report

## Problem Statement

Application contains thousands of log entries.

Management wants to know:

"Which errors occur most frequently?"

---

## Solution

### File: top_error_messages.sh

```bash
#!/bin/bash

echo "===== TOP ERROR REPORT ====="

grep ERROR app.log | sort | uniq -c | sort -nr
```

---

## Skills Used

* grep
* sort
* uniq
* uniq -c
* sort -nr
* Pipelines

---

# Lab 3 - Last Error Investigation

## Problem Statement

Production application crashed.

Need to inspect latest log entries.

---

## Commands

```bash
tail app.log
```

```bash
tail -n 20 app.log
```

```bash
head app.log
```

```bash
head -n 10 app.log
```

---

## Skills Used

* tail
* head

---

# Lab 4 - Error Count Verification

## Problem Statement

Before creating incident report, count total errors.

---

## Commands

```bash
grep ERROR app.log | wc -l
```

---

## Skills Used

* grep
* wc

---

# Lab 5 - Daily Backup Scheduling

## Problem Statement

Organization requires automatic backup every day at 2 AM.

---

## Cron Entry

```cron
0 2 * * * /home/ubuntu/scripts/backup.sh
```

---

## Skills Used

* crontab
* Scheduling

---

# Lab 6 - Health Check Scheduling

## Problem Statement

Operations team wants health checks every 5 minutes.

---

## Cron Entry

```cron
*/5 * * * * /home/ubuntu/scripts/health_check.sh
```

---

## Skills Used

* Cron Scheduling
* Automation

---

# Lab 7 - Weekly Log Cleanup

## Problem Statement

Old logs consume disk space.

Cleanup should happen every Sunday at 2 AM.

---

## Cron Entry

```cron
0 2 * * 0 /home/ubuntu/scripts/log_cleanup.sh
```

---

## Skills Used

* Cron
* Log Maintenance

---

# Lab 8 - Process Investigation

## Problem Statement

Application is hanging.

Need to identify running processes.

---

## Commands

```bash
ps -ef
```

---

### Find Nginx Process

```bash
pgrep nginx
```

---

### Find SSH Process

```bash
pgrep ssh
```

---

## Skills Used

* Process Management
* Troubleshooting

---

# Lab 9 - Process Termination

## Problem Statement

Application process is consuming excessive CPU.

Need to terminate it.

---

## Graceful Termination

```bash
kill PID
```

---

## Force Termination

```bash
kill -9 PID
```

---

## Skills Used

* Process Control
* Incident Management

---

# Lab 10 - Server Precheck Validation

## Problem Statement

Before deployment, validate server readiness.

Checks Required:

* Disk Usage
* Memory Usage
* NGINX Status

---

## Solution

### File: server_precheck.sh

```bash
#!/bin/bash

echo "===== SERVER PRECHECK REPORT ====="

disk=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

total=$(free -m | awk 'NR==2 {print $2}')

used=$(free -m | awk 'NR==2 {print $3}')

memory=$(( used * 100 / total ))

if [ "$disk" -ge 80 ]
then
    disk_status="ALERT"
else
    disk_status="HEALTHY"
fi

if [ "$memory" -ge 80 ]
then
    memory_status="ALERT"
else
    memory_status="HEALTHY"
fi

if systemctl is-active --quiet nginx
then
    nginx_status="RUNNING"
else
    nginx_status="DOWN"
fi

echo "Disk Usage    : ${disk}% (${disk_status})"

echo "Memory Usage  : ${memory}% (${memory_status})"

echo "NGINX Status  : ${nginx_status}"

echo "===== PRECHECK COMPLETE ====="
```

---

## Skills Used

* df
* free
* awk
* tr
* systemctl
* if-else
* Variables
* Arithmetic Expansion

---

# Interview Questions

### Q1

How would you find total errors in a log file?

```bash
grep -c ERROR app.log
```

---

### Q2

How would you find top occurring errors?

```bash
grep ERROR app.log | sort | uniq -c | sort -nr
```

---

### Q3

How would you schedule a script every 15 minutes?

```cron
*/15 * * * *
```

---

### Q4

How would you find a process ID?

```bash
pgrep nginx
```

---

### Q5

How would you kill a process?

```bash
kill PID
```

or

```bash
kill -9 PID
```

---

### Q6

How would you check if nginx is running?

```bash
systemctl is-active --quiet nginx
```
