# Day 2 - Variables, User Input, Arguments and Conditionals

## Objective

Learn how to:

* Declare variables
* Accept user input
* Use command line arguments
* Create Linux users using Bash
* Use if-else and elif statements
* Debug common Bash errors

---

# Task 1 - Variables

## Script

```bash
#!/bin/bash

name="Micah"

echo "Name is $name"
```

## Output

```text
Name is Micah
```

## Learning

Variable assignment in Bash does not allow spaces around '='.

Correct:

```bash
name="Micah"
```

Wrong:

```bash
name = "Micah"
```

Error:

```text
command not found
```

---

# Task 2 - Dynamic Variables

## Script

```bash
#!/bin/bash

name="Micah"

echo "Name is $name and date is $(date)"
```

## Output

```text
Name is Micah and date is Thu Jun 11 05:16:27 UTC 2026
```

## Learning

```bash
$(date)
```

executes the date command and inserts the output.

---

# Task 3 - User Input

## Script

```bash
#!/bin/bash

read -p "enter the name: " name

echo "You entered $name"
```

## Output

```text
enter the name:
micah

You entered micah
```

## Learning

```bash
read
```

accepts input from the keyboard.

---

# Task 4 - Create User Script

## Script

```bash
#!/bin/bash

read -p "Enter Username : " username

echo "entered username $username"

sudo useradd -m "$username"

echo "New User added"
```

## Learning

Creates a Linux user and home directory.

```bash
useradd -m username
```

creates:

```text
/home/username
```

---

# Mistake Encountered

## Problem

```bash
echo "entered username $username
```

Missing closing quote.

## Error

```text
unexpected EOF while looking for matching "
```

## Fix

```bash
echo "entered username $username"
```

---

# Task 5 - Linux User Verification

## Command

```bash
cat /etc/passwd
```

## Learning

Displays all users in Linux.

Example:

```text
micah:x:1003:1003::/home/micah:/bin/bash
```

---

## Command

```bash
cat /etc/group
```

## Learning

Displays all Linux groups.

Example:

```text
docker:x:113:micah
```

---

# Task 6 - Script Permissions

## Problem

```text
Permission denied
```

## Cause

Script lacked execute permission.

## Fix

```bash
chmod 755 createuser.sh
```

## Learning

Permission Breakdown:

```text
755

Owner : rwx
Group : r-x
Others: r-x
```

---

# Task 7 - Command Line Arguments

## Example

```bash
./createuser.sh friend1 friend2
```

## Access Arguments

```bash
echo $1
echo $2
```

Output:

```text
friend1
friend2
```

## Learning

Special Variables:

| Variable | Meaning             |
| -------- | ------------------- |
| $0       | Script Name         |
| $1       | First Argument      |
| $2       | Second Argument     |
| $#       | Number of Arguments |
| $@       | All Arguments       |

---

# Task 8 - Conditionals

## Script

```bash
#!/bin/bash

read -p "Enter the name of MICAH's company: " name
read -p "Read the age of Micah: " age

if [[ $name == "UBS" ]]
then
    echo "Correct answer"
elif [[ $age -ge 20 ]]
then
    echo "Correct answer"
else
    echo "Incorrect answers"
fi
```

## Output

```text
Enter the name of MICAH's company: UBS
Read the age of Micah: 23

Correct answer
```

---

# Mistake Encountered

## Wrong

```bash
if [[$name == "UBS" ]];
```

## Error

```text
[[UBS: command not found
```

## Correct

```bash
if [[ $name == "UBS" ]];
```

## Learning

Spaces are mandatory.

Correct:

```bash
[[ $age -ge 20 ]]
```

Wrong:

```bash
[[$age -ge 20]]
```

---

# Comparison Operators Learned

## String Comparison

```bash
==

!=
```

Example:

```bash
[[ $name == "UBS" ]]
```

---

## Numeric Comparison

```bash
-ge
-gt
-le
-lt
-eq
-ne
```

Example:

```bash
[[ $age -ge 20 ]]
```

Meaning:

```text
Greater than or equal to 20
```

---

# Errors Fixed Today

### Error 1

```text
!#/bin/bash
```

Correct:

```bash
#!/bin/bash
```

---

### Error 2

```bash
name = "Micah"
```

Correct:

```bash
name="Micah"
```

---

### Error 3

Missing quote.

```bash
echo "text
```

Correct:

```bash
echo "text"
```

---

### Error 4

```bash
[[$name == "UBS"]]
```

Correct:

```bash
[[ $name == "UBS" ]]
```

---

# Day 2 Summary

Concepts Learned:

* Variables
* Dynamic Variables
* User Input
* Command Line Arguments
* Linux User Creation
* File Permissions
* if
* elif
* else
* String Comparison
* Numeric Comparison
* Bash Debugging

Total Scripts Written:

1. Variables.sh
2. createuser.sh
3. conditionals.sh

Most Important Learning:

Bash is extremely sensitive to spaces, quotes and brackets.
A single missing space or quote can break the script.
