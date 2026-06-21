# directory_exists.sh

## Topic

Linux File Management

## Sub Topic

Directory Validation & Creation

---

## Real World Problem Statement

In production environments, many scripts require a directory before performing operations.

Examples:

* Backup Scripts
* Log Collection Scripts
* Report Generation Scripts
* Deployment Scripts

Before storing files, a DevOps Engineer must verify whether the target directory exists.

If the directory does not exist:

```text
Create it automatically.
```

This ensures automation scripts do not fail due to missing directories.

---

## Commands Used

| Command  | Purpose                 |
| -------- | ----------------------- |
| read     | Accept user input       |
| if       | Conditional execution   |
| -d       | Check directory exists  |
| mkdir    | Create directory        |
| mkdir -p | Create directory safely |
| $?       | Check command status    |
| echo     | Display output          |
| exit     | Return status code      |

---

## Complete Script

```bash
#!/bin/bash

read -p "Enter directory name: " dirname

if [ -d "$dirname" ]
then
    echo "Directory already exists"
    exit 0
else
    echo "Directory does not exist"

    mkdir -p "$dirname"

    if [ $? -eq 0 ]
    then
        echo "Directory created successfully"
        exit 0
    else
        echo "Directory creation failed"
        exit 1
    fi
fi
```

---

## Script Explanation

### Step 1

Accept directory name from user.

```bash
read -p "Enter directory name: " dirname
```

Example:

```text
backups
```

Stored in:

```bash
$dirname
```

---

### Step 2

Check whether directory exists.

```bash
[ -d "$dirname" ]
```

Meaning:

```text
-d = Directory Exists
```

Examples:

```text
backups/     -> TRUE
logs/        -> TRUE
app.log      -> FALSE
```

---

### Step 3

Directory Exists

```bash
echo "Directory already exists"
```

Return success.

```bash
exit 0
```

---

### Step 4

Directory Missing

```bash
mkdir -p "$dirname"
```

Create directory.

---

### Step 5

Verify Creation

```bash
$?
```

Represents:

```text
Exit status of previous command.
```

---

### Step 6

Success

```bash
echo "Directory created successfully"
```

---

### Step 7

Failure

```bash
echo "Directory creation failed"
```

---

## Sample Execution

### Case 1

Directory Exists

```bash
$ ./directory_exists.sh

Enter directory name: backups

Directory already exists
```

---

### Case 2

Directory Missing

```bash
$ ./directory_exists.sh

Enter directory name: reports

Directory does not exist

Directory created successfully
```

---

## Expected Output

```text
Directory already exists
```

or

```text
Directory created successfully
```

---

## Interview Questions

### Q1. What does -d mean?

Checks whether a directory exists.

Example:

```bash
[ -d backups ]
```

---

### Q2. Difference between -f and -d ?

```text
-f -> File Exists

-d -> Directory Exists
```

Examples:

```bash
[ -f app.log ]
```

```bash
[ -d backups ]
```

---

### Q3. Why use mkdir -p instead of mkdir ?

Normal mkdir:

```bash
mkdir backups
```

Fails if directory already exists.

---

mkdir -p:

```bash
mkdir -p backups
```

Benefits:

```text
Creates parent directories automatically

Does not fail if directory already exists
```

---

### Q4. What does $? mean?

Represents exit status of the previous command.

Example:

```bash
mkdir reports

echo $?
```

Output:

```text
0
```

Meaning:

```text
Success
```

---

### Q5. Why return exit codes?

Useful for automation.

```text
0 -> Success

1 -> Failure
```

Other scripts can use these codes.

---

## Production Improvements

Production version may additionally check:

### Write Permission

```bash
[ -w "$dirname" ]
```

---

### Read Permission

```bash
[ -r "$dirname" ]
```

---

### Available Disk Space

```bash
df -h
```

---

### Directory Ownership

```bash
ls -ld "$dirname"
```

---

## Key Learnings

* User Input
* Variables
* if-else
* Directory Validation
* mkdir
* mkdir -p
* Exit Codes
* Linux Directory Tests

---

## Real DevOps Use Cases

* Create backup directories
* Create log directories
* Create deployment folders
* Create artifact storage directories
* Create report generation folders

---

## Difficulty

⭐ Beginner

---

## DevOps Interview Importance

⭐⭐⭐⭐⭐ High

---

## Related Scripts

Next Script:

```text
03-backup_script.sh
```

Concepts introduced:

```text
cp
date
timestamp generation
basename
backup automation
```

This script builds directly on directory validation and is one of the most commonly asked Bash automation scenarios in DevOps interviews.
