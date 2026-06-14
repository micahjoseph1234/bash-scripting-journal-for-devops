# Day 4 - Mistakes, Learnings & Commands Cheat Sheet

## Objective

Today's focus was:

- Package Management
- Java Installation
- Maven Installation
- Tomcat Installation
- Environment Variables
- sed Command
- Functions
- Real-world DevOps Automation

---

# Mistakes & Corrections

## 1. Incorrect Shebang

### Wrong

```bash
!#/bin/bash
```

### Correct

```bash
#!/bin/bash
```

### Learning

Every shell script should start with:

```bash
#!/bin/bash
```

This tells Linux to execute the script using Bash.

---

## 2. Variable Assignment

### Wrong

```bash
name = "Micah"
```

### Correct

```bash
name="Micah"
```

### Learning

No spaces are allowed in variable assignment.

---

## 3. Variable Name Mismatch

### Wrong

```bash
read num
echo $nums
```

### Correct

```bash
read num
echo $num
```

### Learning

Variable names must match exactly.

---

## 4. Missing Quotes

### Wrong

```bash
echo "entered username $username
```

### Correct

```bash
echo "entered username $username"
```

### Learning

Always close quotes properly.

---

## 5. Double Bracket Syntax

### Wrong

```bash
if [[$name == "UBS" ]];
```

### Correct

```bash
if [[ $name == "UBS" ]]
```

### Learning

Spaces are mandatory inside:

```bash
[[ ]]
```

---

## 6. Numeric Comparisons

### Wrong

```bash
if [[ $age >= 20 ]]
```

### Correct

```bash
if [[ $age -ge 20 ]]
```

### Learning

Use:

| Operator | Meaning |
|-----------|----------|
| -gt | Greater Than |
| -lt | Less Than |
| -ge | Greater Than Equal |
| -le | Less Than Equal |
| -eq | Equal |
| -ne | Not Equal |

---

## 7. Assignment With Spaces

### Wrong

```bash
num = $((num+1))
```

### Correct

```bash
num=$((num+1))
```

### Learning

No spaces during assignment.

---

## 8. While Loop Arithmetic

### Wrong

```bash
while [[ $num%2==0 ]]
```

### Correct

```bash
while (( num % 2 == 0 ))
```

### Learning

Use:

```bash
(( ))
```

for arithmetic operations.

---

## 9. For Loop Variable Mistake

### Wrong

```bash
for (( i=$1;i<=$2;i++ ))
do
    mkdir day$1
done
```

### Correct

```bash
for (( i=$1;i<=$2;i++ ))
do
    mkdir day$i
done
```

### Learning

Always use the loop variable inside the loop.

---

## 10. Script Permission Error

### Error

```text
Permission denied
```

### Fix

```bash
chmod 755 script.sh
```

### Learning

Scripts require execute permissions.

---

## 11. Package Name vs Command Name

### Git

| Command | Package |
|----------|----------|
| git | git |

### Java

| Command | Package |
|----------|----------|
| java | default-jdk |

### Maven

| Command | Package |
|----------|----------|
| mvn | maven |

### Mistake

```bash
maven --version
```

### Correct

```bash
mvn --version
```

---

## 12. Command Execution vs Comparison

### Wrong

```bash
if [[ command -v git ]]
```

### Correct

```bash
if command -v git >/dev/null 2>&1
```

### Learning

Commands execute directly.

```bash
if command
```

Comparisons use:

```bash
if [[ condition ]]
```

---

## 13. Understanding command -v

### Example

```bash
command -v git
```

Output:

```text
/usr/bin/git
```

### Purpose

Checks whether a command exists.

---

## 14. Understanding /dev/null

### Example

```bash
echo "Hello" > /dev/null
```

Output:

```text
Nothing
```

### Learning

```text
/dev/null = Linux Dustbin
```

Anything sent here disappears.

---

## 15. Understanding >/dev/null 2>&1

### Example

```bash
command -v git >/dev/null 2>&1
```

### Meaning

```text
Run command silently
Hide normal output
Hide error output
Only check success or failure
```

---

## 16. Functions

### Syntax

```bash
check_git()
{
    commands
}
```

### Call Function

```bash
check_git
```

### Learning

Functions help avoid repetitive code.

---

## 17. Reusable Function Design

### Before

```bash
check_git()
check_java()
check_maven()
```

### Better Approach

```bash
check_and_install()
{
}
```

Usage:

```bash
check_and_install git git
check_and_install java default-jdk
check_and_install mvn maven
```

### Learning

Reusable functions reduce code duplication.

---

# Commands Learned Today

## Package Management

```bash
apt update -y

apt install git -y

apt install maven -y

apt install default-jdk -y
```

---

## Git

```bash
git --version
```

```bash
command -v git
```

---

## Java

```bash
java --version
```

```bash
command -v java
```

---

## Maven

```bash
mvn --version
```

```bash
command -v mvn
```

---

## Tomcat

Download:

```bash
wget URL
```

Extract:

```bash
tar -xvzf apache-tomcat.tar.gz
```

Rename:

```bash
mv apache-tomcat-8.5.99 tomcat
```

Start:

```bash
./startup.sh
```

---

## Environment Variables

Check:

```bash
echo $PATH

echo $JAVA_HOME

echo $MAVEN_HOME
```

Create:

```bash
export MY_NAME="Micah"
```

Verify:

```bash
echo $MY_NAME
```

Delete:

```bash
unset MY_NAME
```

---

## Process Verification

```bash
ps -ef
```

Tomcat Process:

```bash
ps -ef | grep tomcat
```

---

## Port Verification

```bash
ss -tulnp
```

---

## sed Command

Replace First Occurrence:

```bash
echo "Bash Scripting Bash Language" | sed 's/Bash/Perl/'
```

Replace All Occurrences:

```bash
echo "Bash Scripting Bash Language" | sed 's/Bash/Perl/g'
```

---

# Biggest Learning

### Before

```text
Learn Bash Syntax
      ↓
Find Problem
```

### After

```text
Real Problem
      ↓
Manual Linux Commands
      ↓
Automate Using Bash
```

This is the mindset shift from Java/DSA thinking to DevOps automation thinking.

---

# Day 4 Status

✅ Package Management

✅ Java Installation

✅ Maven Installation

✅ Tomcat Installation

✅ Environment Variables

✅ PATH Variable

✅ sed Command

✅ Functions

✅ Reusable Functions

✅ DevOps Automation Basics
