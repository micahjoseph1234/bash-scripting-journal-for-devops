# file_exists.sh

## Topic

Linux File Management

## Sub Topic

File Validation

---

## Real World Problem Statement

In production environments, scripts often need to process files such as:

* Application Logs
* Configuration Files
* Backup Files
* Data Files

Before performing any operation, a DevOps Engineer must verify whether the file exists.

For example:

```text
Process application.log only if it exists.
```

This prevents script failures and improves reliability.

---

## Commands Used

| Command | Purpose               |
| ------- | --------------------- |
| read    | Accept user input     |
| if      | Conditional execution |
| -f      | Verify file exists    |
| echo    | Display output        |
| exit    | Return status code    |

---

## Complete Script

```bash
#!/bin/bash

read -p "Enter filename: " filename

if [ -f "$filename" ]
then
    echo "File exists"
    exit 0
else
    echo "File does not exist"
    exit 1
fi
```

---

## Script Explanation

### Step 1

Accept filename from user.

```bash
read -p "Enter filename: " filename
```

Example:

```text
app.log
```

Stored inside:

```bash
$filename
```

---

### Step 2

Check whether file exists.

```bash
[ -f "$filename" ]
```

Meaning:

```text
-f = Regular File Exists
```

Examples:

```text
app.log      -> TRUE
config.txt   -> TRUE
logs/        -> FALSE
```

---

### Step 3

If file exists

```bash
echo "File exists"
```

Return success.

```bash
exit 0
```

---

### Step 4

If file doesn't exist

```bash
echo "File does not exist"
```

Return failure.

```bash
exit 1
```

---

## Sample Execution

### Case 1

File Exists

```bash
$ ./file_exists.sh

Enter filename: app.log

File exists
```

---

### Case 2

File Doesn't Exist

```bash
$ ./file_exists.sh

Enter filename: abc.log

File does not exist
```

---

## Expected Output

```text
File exists
```

or

```text
File does not exist
```

---

## Interview Questions

### Q1. What does -f mean?

Checks whether a regular file exists.

Example:

```bash
[ -f app.log ]
```

---

### Q2. Difference between -f and -d ?

```text
-f -> File

-d -> Directory
```

Examples:

```bash
[ -f app.log ]
```

```bash
[ -d logs ]
```

---

### Q3. Why use quotes around variables?

Good:

```bash
"$filename"
```

Bad:

```bash
$filename
```

Quotes prevent issues with spaces.

Example:

```text
my file.txt
```

---

### Q4. What is exit 0?

```text
0 = Success
```

---

### Q5. What is exit 1?

```text
Non-Zero = Failure
```

Convention:

```text
0 = Success

1 = Failure
```

---

## Production Improvements

Production version may also check:

* Read Permission
* Empty File
* File Size
* Ownership

Example:

```bash
[ -r "$filename" ]
```

Check read access.

---

## Key Learnings

* User Input
* Variables
* if-else
* File Validation
* Exit Codes
* Linux File Tests

---

## Real DevOps Use Cases

* Validate log files before parsing
* Validate backup files before restore
* Validate configuration files before deployment
* Validate report files before processing

---

## Difficulty

⭐ Beginner

---

## DevOps Interview Importance

⭐⭐⭐⭐⭐ High
