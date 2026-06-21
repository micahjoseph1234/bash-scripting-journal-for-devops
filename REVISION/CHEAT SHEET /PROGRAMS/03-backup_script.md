# backup_script.sh

## Topic

File Management

## Sub Topic

Backup Automation

---

## Real World Problem Statement

Before deployments, upgrades, migrations, or maintenance activities, DevOps Engineers must create backups of important files.

Examples:

* Application Configuration Files
* NGINX Configuration Files
* Jenkins Configuration
* Database Dump Files
* Log Files

The script should:

* Accept a filename from the user
* Verify the file exists
* Verify backup directory exists
* Create backup directory if missing
* Generate a timestamp
* Create a timestamped backup copy
* Display success/failure status

---

## Commands Used

| Command  | Purpose               |
| -------- | --------------------- |
| read     | Accept user input     |
| if       | Conditional execution |
| -f       | Check file exists     |
| mkdir -p | Create directory      |
| cp       | Copy file             |
| date     | Generate timestamp    |
| basename | Extract filename      |
| $?       | Check command status  |
| exit     | Return exit code      |

---

## Complete Script

```bash
#!/bin/bash

read -p "Enter filename: " filename

read -p "Enter backup directory: " backupdir

if [ ! -f "$filename" ]
then
    echo "ERROR: File does not exist"
    exit 1
fi

mkdir -p "$backupdir"

timestamp=$(date +%Y%m%d_%H%M%S)

backup_file="$backupdir/$(basename "$filename")_$timestamp"

cp "$filename" "$backup_file"

if [ $? -eq 0 ]
then
    echo "Backup completed successfully"
    echo "Backup Location: $backup_file"
    exit 0
else
    echo "Backup failed"
    exit 1
fi
```

---

## Script Flow

```text
User Enters Filename
        ↓
Verify File Exists
        ↓
Verify Backup Directory
        ↓
Create Directory If Missing
        ↓
Generate Timestamp
        ↓
Copy File
        ↓
Display Result
```

---

## Script Explanation

### Step 1

Accept file name.

```bash
read -p "Enter filename: " filename
```

Example:

```text
nginx.conf
```

Stored inside:

```bash
$filename
```

---

### Step 2

Accept backup directory.

```bash
read -p "Enter backup directory: " backupdir
```

Example:

```text
backups
```

Stored inside:

```bash
$backupdir
```

---

### Step 3

Verify file exists.

```bash
if [ ! -f "$filename" ]
```

Meaning:

```text
!
=
NOT
```

If file doesn't exist:

```bash
exit 1
```

Stop execution.

---

### Step 4

Create backup directory.

```bash
mkdir -p "$backupdir"
```

Benefits:

```text
Creates directory if missing

Does not fail if already exists
```

---

### Step 5

Generate timestamp.

```bash
timestamp=$(date +%Y%m%d_%H%M%S)
```

Example:

```text
20260622_191530
```

---

### Step 6

Generate backup filename.

```bash
backup_file="$backupdir/$(basename "$filename")_$timestamp"
```

Example:

```text
backups/nginx.conf_20260622_191530
```

---

### Step 7

Copy file.

```bash
cp "$filename" "$backup_file"
```

---

### Step 8

Verify copy success.

```bash
$?
```

Returns:

```text
0 = Success

Non-Zero = Failure
```

---

## Sample Execution

### Input

```bash
$ ./backup_script.sh

Enter filename: app.log

Enter backup directory: backups
```

---

### Output

```text
Backup completed successfully

Backup Location:

backups/app.log_20260622_191530
```

---

## Expected Directory Structure

Before:

```text
project/

app.log
```

---

After:

```text
project/

app.log

backups/

app.log_20260622_191530
```

---

## Interview Questions

### Q1. Why use backups before deployment?

To enable rollback if deployment fails.

---

### Q2. What does basename do?

Extracts only filename.

Example:

```bash
basename /home/ubuntu/app.log
```

Output:

```text
app.log
```

---

### Q3. Why use timestamp in backup names?

Prevents overwriting previous backups.

Example:

```text
app.log_20260622_180000

app.log_20260622_190000
```

---

### Q4. What is command substitution?

Running command and storing output.

Example:

```bash
timestamp=$(date)
```

---

### Q5. Why use mkdir -p ?

```text
Creates parent directories

Does not fail if already exists
```

---

### Q6. Difference between cp and mv ?

```text
cp → Copy File

mv → Move/Rename File
```

---

## Production Improvements

A production-grade backup script may also:

### Compress Backup

```bash
tar -czf backup.tar.gz file
```

---

### Backup Multiple Files

```bash
for file in *.log
```

---

### Store Backups By Date

```text
backups/

2026-06-22/

2026-06-23/
```

---

### Send Backup Status Email

```bash
mail
```

---

### Upload Backup To S3

```bash
aws s3 cp
```

---

## Key Learnings

* File Validation
* Directory Validation
* mkdir -p
* cp
* date
* basename
* Variables
* Command Substitution
* Exit Codes
* Backup Automation

---

## Real DevOps Use Cases

* Backup NGINX Configurations
* Backup Jenkins Configurations
* Backup Application Properties
* Backup Deployment Artifacts
* Backup Log Files Before Cleanup

---

## Difficulty

⭐⭐ Beginner to Intermediate

---

## DevOps Interview Importance

⭐⭐⭐⭐⭐ Very High

---

## Related Scripts

Previous:

```text
02-directory_exists.sh
```

Next:

```text
04-log_cleanup.sh
```

Concepts introduced in next script:

```text
find
mtime
delete
log retention
disk space management
```
