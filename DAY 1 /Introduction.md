# Day 1 - Introduction to Bash Scripting

## Objective

The objective of this lab is to learn:

* Creating Bash scripts
* Understanding the shebang (`#!/bin/bash`)
* Using the `echo` command
* Running shell scripts
* Understanding execute permissions

---

## Task 1 - Create Working Directory

### Commands

```bash
mkdir shell-scripting-module-day1
cd shell-scripting-module-day1
pwd
```

### Expected Output

```text
/home/ubuntu/shell-scripting-module-day1
```

### Learning

* `mkdir` creates a directory
* `cd` changes the current directory
* `pwd` prints the current working directory

---

## Task 2 - Create First Bash Script

### Command

```bash
vim hello.sh
```

### Script Content

```bash
#!/bin/bash

echo "Micah Joseph! I am proud of you"
```

### Save and Exit Vim

```text
ESC
:wq
```

---

## Task 3 - Verify Script Content

### Command

```bash
cat hello.sh
```

### Expected Output

```bash
#!/bin/bash

echo "Micah Joseph! I am proud of you"
```

### Learning

* `cat` displays file contents

---

## Task 4 - Check File Permissions

### Command

```bash
ls -l
```

### Example Output

```text
-rw-rw-r-- 1 ubuntu ubuntu 48 Jun 10 14:40 hello.sh
```

### Observation

The file does not yet have execute permission.

---

## Task 5 - Execute Without Permission

### Command

```bash
./hello.sh
```

### Expected Output

```text
Permission denied
```

### Learning

Linux requires execute permission before a script can be run directly.

---

## Task 6 - Add Execute Permission

### Command

```bash
chmod +x hello.sh
```

### Verify

```bash
ls -l
```

### Example Output

```text
-rwxrwxr-x 1 ubuntu ubuntu 48 Jun 10 14:40 hello.sh
```

### Learning

* `chmod +x` adds execute permission

---

## Task 7 - Execute Script

### Command

```bash
./hello.sh
```

### Expected Output

```text
Micah Joseph! I am proud of you
```

---

## Task 8 - Understanding Shebang

### Script Header

```bash
#!/bin/bash
```

### Explanation

* `#!` is called the shebang
* `/bin/bash` is the Bash interpreter path

When running:

```bash
./hello.sh
```

Linux internally executes:

```bash
/bin/bash hello.sh
```

---

## Task 9 - Run Script Using Bash

### Command

```bash
bash hello.sh
```

### Expected Output

```text
Micah Joseph! I am proud of you
```

### Learning

Running a script with `bash script.sh` does not require execute permission.

---

## Task 10 - Create Another Script

### Command

```bash
vim welcome.sh
```

### Script Content

```bash
#!/bin/bash

echo "Welcome to Bash Scripting"
echo "This is Day 1"
echo "Learning DevOps Step by Step"
```

### Execute

```bash
chmod +x welcome.sh
./welcome.sh
```

### Expected Output

```text
Welcome to Bash Scripting
This is Day 1
Learning DevOps Step by Step
```

---

## Assignment Challenge

Create a script named:

```bash
motivation.sh
```

### Expected Output

```text
I will become a DevOps Engineer
I will master Linux
I will master Bash Scripting
```

### Requirements

* Use shebang
* Use echo statements
* Add execute permission
* Run using `./motivation.sh`

---

## Key Takeaways

* Created Bash scripts
* Used Vim editor
* Learned shebang syntax
* Used echo command
* Understood Linux execute permissions
* Learned chmod +x
* Learned the difference between `bash script.sh` and `./script.sh`
