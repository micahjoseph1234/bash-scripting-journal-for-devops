# Day 7 - Advanced Bash Scripting for DevOps

## Topics Covered

* Log Analysis
* Cron Jobs (Job Scheduling)
* Process Management
* DevOps Utility Scripts
* Server Health Validation

---

# Log Analysis

## Why Log Analysis?

Logs help identify:

* Application Errors
* Database Failures
* Login Failures
* Service Crashes
* Performance Issues

---

## grep

Used to search specific text patterns inside files.

### Search Errors

```bash
grep ERROR app.log
```

### Count Errors

```bash
grep -c ERROR app.log
```

### Ignore Case

```bash
grep -i error app.log
```

### Exclude Matching Lines

```bash
grep -v INFO app.log
```

---

## tail

Used to view latest records.

### Last 10 Lines

```bash
tail app.log
```

### Last 3 Lines

```bash
tail -n 3 app.log
```

---

## head

Used to view beginning of file.

### First 10 Lines

```bash
head app.log
```

### First 3 Lines

```bash
head -n 3 app.log
```

---

## wc

Used for counting.

### Count Lines

```bash
wc -l app.log
```

### Count Words

```bash
wc -w app.log
```

### Count Characters

```bash
wc -c app.log
```

---

## sort

Sorts records alphabetically.

```bash
sort app.log
```

---

## uniq

Removes duplicate records.

```bash
sort app.log | uniq
```

---

## uniq -c

Counts duplicate occurrences.

```bash
sort app.log | uniq -c
```

---

## sort -nr

Numeric Reverse Sort.

```bash
grep ERROR app.log | sort | uniq -c | sort -nr
```

Shows highest occurring errors first.

---

# Cron Jobs

## What is Cron?

Cron is Linux Task Scheduler.

Used for:

* Backups
* Log Cleanup
* Health Monitoring
* Report Generation

---

## View Cron Jobs

```bash
crontab -l
```

---

## Create/Edit Cron Jobs

```bash
crontab -e
```

---

## Cron Syntax

```text
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day Of Week
│ │ │ └──── Month
│ │ └────── Day Of Month
│ └──────── Hour
└────────── Minute
```

---

## Common Schedules

### Every Minute

```bash
* * * * *
```

### Every 5 Minutes

```bash
*/5 * * * *
```

### Every 15 Minutes

```bash
*/15 * * * *
```

### Every Hour

```bash
0 * * * *
```

### Daily 1 AM

```bash
0 1 * * *
```

### Daily 2 AM

```bash
0 2 * * *
```

### Sunday 2 AM

```bash
0 2 * * 0
```

---

# Process Management

## ps -ef

Shows all running processes.

```bash
ps -ef
```

---

## Important Columns

### UID

User running process.

### PID

Process ID.

### PPID

Parent Process ID.

### CMD

Command running.

---

## pgrep

Find PID by process name.

```bash
pgrep nginx
```

---

## kill

Gracefully stop process.

```bash
kill PID
```

---

## kill -9

Forcefully terminate process.

```bash
kill -9 PID
```

---

# DevOps Utility Scripts

## Server Precheck

Checks:

* Disk Usage
* Memory Usage
* Service Status

Used before deployments.

---

## Disk Usage

```bash
df -h /
```

Extract Usage:

```bash
df -h / | awk 'NR==2 {print $5}'
```

Remove %:

```bash
tr -d '%'
```

---

## Memory Usage

```bash
free -m
```

Total Memory:

```bash
free -m | awk 'NR==2 {print $2}'
```

Used Memory:

```bash
free -m | awk 'NR==2 {print $3}'
```

Usage Percentage:

```bash
usage=$(( used * 100 / total ))
```

---

## Service Status

```bash
systemctl is-active --quiet nginx
```

---

# Key Takeaways

* Learned production log analysis commands.
* Learned Linux task scheduling using Cron.
* Learned process monitoring and termination.
* Built deployment readiness scripts.
* Learned error frequency analysis.
* Learned server health validation automation.
