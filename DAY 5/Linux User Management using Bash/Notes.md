# Day 5 - Linux User Management using Bash

## Objective

Learn how Linux users and groups are managed and automate user administration tasks using Bash scripting.

---

# Why User Management Matters

As a DevOps Engineer, common responsibilities include:

* Creating new users
* Deleting users
* Managing groups
* Granting permissions
* Locking and unlocking accounts
* Bulk onboarding users
* Auditing user information

---

# Linux User Management Concepts

## Check Current User

```bash
whoami
```

Example:

```text
ubuntu
```

---

## Display User Information

```bash
id username
```

Example:

```bash
id micah
```

Output:

```text
uid=1003(micah) gid=1003(micah) groups=1003(micah),113(docker)
```

---

## User Database

Linux stores users in:

```bash
/etc/passwd
```

View all users:

```bash
cat /etc/passwd
```

Example Entry:

```text
micah:x:1003:1003::/home/micah:/bin/bash
```

Breakdown:

```text
Username      -> micah
UID           -> 1003
GID           -> 1003
Home Directory-> /home/micah
Shell         -> /bin/bash
```

---

## Group Database

Linux stores groups in:

```bash
/etc/group
```

View all groups:

```bash
cat /etc/group
```

---

# User Management Commands

## Create User

```bash
sudo useradd -m -s /bin/bash micah
```

Options:

```text
-m  -> Create Home Directory
-s  -> Specify Login Shell
```

---

## Verify User

```bash
id micah
```

---

## Delete User

Delete User Only:

```bash
sudo userdel micah
```

Delete User and Home Directory:

```bash
sudo userdel -r micah
```

---

## Create Group

```bash
sudo groupadd devops
```

Verify:

```bash
grep devops /etc/group
```

---

## Add User To Group

```bash
sudo usermod -aG devops micah
```

Verify:

```bash
groups micah
```

Example Output:

```text
micah : micah docker devops
```

---

## Lock User Account

```bash
sudo passwd -l micah
```

---

## Unlock User Account

```bash
sudo passwd -u micah
```

---

## Check User Status

```bash
sudo passwd -S micah
```

Example:

```text
micah P
```

```text
P -> Password Active
L -> Locked
```

---

# Bash Concepts Learned

## Reading User Input

```bash
read -p "Enter Username: " name
```

---

## Checking User Existence

```bash
if id "$name" >/dev/null 2>&1
then
    echo "User Exists"
else
    echo "User Does Not Exist"
fi
```

---

## Understanding >/dev/null 2>&1

```bash
command >/dev/null 2>&1
```

Purpose:

```text
Hide Normal Output
Hide Error Output
Check Command Success Silently
```

---

## Understanding Exit Status

Check Previous Command Result:

```bash
echo $?
```

Meaning:

```text
0 -> Success
Non-Zero -> Failure
```

Example:

```bash
sudo useradd micah

if [ $? -eq 0 ]
then
    echo "User Created Successfully"
else
    echo "User Creation Failed"
fi
```

---

# While Loop Concept

## Reading File Line By Line

users.txt

```text
john
alice
bob
charlie
```

Script:

```bash
while read user
do
    echo $user
done < users.txt
```

Output:

```text
john
alice
bob
charlie
```

---

## Real World Use Case

HR provides:

```text
users.txt
```

Create all users automatically.

```bash
while read user
do
    sudo useradd -m -s /bin/bash "$user"
done < users.txt
```

---

# Scripts Completed

## create_user.sh

Purpose:

```text
Create Linux User
Verify User Creation
```

---

## delete_user.sh

Purpose:

```text
Delete Linux User
Verify User Deletion
```

---

## user_exists.sh

Purpose:

```text
Check Whether User Exists
```

---

## add_user_to_group.sh

Purpose:

```text
Add Existing User To Group
Create Group If Missing
```

---

## bulk_user_creation.sh

Purpose:

```text
Read Users From File
Create Users Automatically
```

---

## user_provisioning.sh

Purpose:

```text
Create User
Create Group
Add User To Group
Verify Configuration
```

---

# Interview Questions

## What is UID?

```text
Unique User Identifier
```

---

## What is GID?

```text
Group Identifier
```

---

## Difference Between useradd and usermod

```text
useradd -> Creates New User

usermod -> Modifies Existing User
```

---

## Difference Between groupadd and usermod -aG

```text
groupadd -> Creates New Group

usermod -aG -> Adds User To Existing Group
```

---

## Difference Between Primary and Supplementary Group

```text
Primary Group

Default Group Assigned To User
```

```text
Supplementary Group

Additional Groups Assigned To User
```

---

# Common Mistakes Made Today

## Incorrect useradd Syntax

Wrong:

```bash
useradd username -s /bin/bash -m
```

Preferred:

```bash
useradd -m -s /bin/bash username
```

---

## Using -k Instead Of -d

Wrong:

```bash
useradd -k /home/user
```

Reason:

```text
-k Is Used For Skeleton Directory
```

---

## Forgetting Spaces In Conditions

Wrong:

```bash
if [ $? -eq 0]
```

Correct:

```bash
if [ $? -eq 0 ]
```

---

## Confusing Function Arguments With Script Arguments

Script:

```bash
./script.sh arg1 arg2
```

```text
$1 -> arg1
$2 -> arg2
```

Function:

```bash
myfunc arg1 arg2
```

```text
$1 -> arg1
$2 -> arg2
```

Function Name Is Not Counted As An Argument.

```

---

## Key Takeaway

Today I learned how Linux manages users and groups, how to automate user administration using Bash, how exit codes work, and how to process files line-by-line using while loops for real-world automation tasks.
```
