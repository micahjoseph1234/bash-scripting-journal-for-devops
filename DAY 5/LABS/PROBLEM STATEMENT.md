# Day 5 - User Management Assignments

## Assignment 1 - Create User

### Real World Scenario

A new employee joins the organization and needs a Linux account.

### Objective

Create a Linux user only if the user does not already exist.

### Concepts Used

* read
* if else
* id
* useradd

### Commands Learned

```bash
id username
sudo useradd -m -s /bin/bash username
```

### Solution File

```text
create_user.sh
```

---

## Assignment 2 - Delete User

### Real World Scenario

An employee leaves the company and their account must be removed.

### Objective

Delete a Linux user after verifying that the user exists.

### Concepts Used

* read
* if else
* id
* userdel

### Commands Learned

```bash
sudo userdel username
sudo userdel -r username
```

### Solution File

```text
delete_user.sh
```

---

## Assignment 3 - Check User Existence

### Real World Scenario

Before provisioning resources, DevOps teams verify whether an account already exists.

### Objective

Check whether a Linux user exists.

### Concepts Used

* read
* if else
* id
* exit status

### Commands Learned

```bash
id username
```

### Solution File

```text
user_exists.sh
```

---

## Assignment 4 - Create Group and Add User

### Real World Scenario

A developer needs Docker access and must be added to the docker group.

### Objective

Create group if missing and add user to the group.

### Concepts Used

* grep
* groupadd
* usermod
* if else

### Commands Learned

```bash
sudo groupadd groupname

sudo usermod -aG groupname username

groups username
```

### Solution File

```text
add_user_to_group.sh
```

---

## Assignment 5 - Bulk User Creation

### Real World Scenario

HR shares a list of employees joining the organization.

DevOps must create all users automatically.

### Objective

Read usernames from a file and create users.

### Concepts Used

* while loop
* read
* file handling
* useradd

### Commands Learned

```bash
while read user
do
done < users.txt
```

### Input File

```text
users.txt
```

Example:

```text
john
alice
bob
charlie
```

### Solution File

```text
bulk_user_creation.sh
```

---

## Assignment 6 - Lock User Account

### Real World Scenario

An employee goes on long leave and access must be temporarily disabled.

### Objective

Lock a Linux account.

### Concepts Used

* passwd
* conditional statements

### Commands Learned

```bash
sudo passwd -l username
```

### Solution File

```text
user_lock.sh
```

---

## Assignment 7 - Unlock User Account

### Real World Scenario

The employee returns and requires access restoration.

### Objective

Unlock a Linux account.

### Commands Learned

```bash
sudo passwd -u username
```

### Solution File

```text
user_unlock.sh
```

---

## Assignment 8 - User Information Report

### Real World Scenario

Manager requests details of a Linux user account.

### Objective

Display:

* Username
* UID
* Groups
* Home Directory
* Shell

### Concepts Used

* id
* grep
* /etc/passwd

### Commands Learned

```bash
id username

grep "^username:" /etc/passwd
```

### Solution File

```text
user_info.sh
```

---

## Assignment 9 - User Provisioning Automation

### Real World Scenario

A new developer joins the DevOps team.

Requirements:

* Create Group
* Create User
* Add User To Group
* Verify User

### Objective

Build a single automation script that provisions a Linux user completely.

### Concepts Used

* Functions
* if else
* groupadd
* useradd
* usermod

### Commands Learned

```bash
groupadd

useradd

usermod -aG

id
```

### Solution File

```text
user_provisioning.sh
```

---

# Industry Level Interview Questions

## Beginner

### Q1

How do you create a Linux user?

```bash
useradd -m username
```

---

### Q2

How do you delete a user?

```bash
userdel -r username
```

---

### Q3

How do you check whether a user exists?

```bash
id username
```

---

### Q4

How do you check groups assigned to a user?

```bash
groups username
```

---

### Q5

Where are Linux users stored?

```text
/etc/passwd
```

---

### Q6

Where are Linux groups stored?

```text
/etc/group
```

---

## Intermediate

### Q7

Difference between:

```bash
useradd
```

and

```bash
usermod
```

Answer:

```text
useradd -> Create User

usermod -> Modify Existing User
```

---

### Q8

Difference between:

```bash
groupadd
```

and

```bash
usermod -aG
```

Answer:

```text
groupadd -> Creates Group

usermod -aG -> Adds User To Group
```

---

### Q9

What is UID?

```text
Unique User Identifier
```

---

### Q10

What is GID?

```text
Group Identifier
```

---

## DevOps Interview Level

### Q11

How would you create 500 users automatically?

Answer:

```text
Store users in users.txt

Read using while loop

Create users using useradd
```

---

### Q12

How would you temporarily disable a user account?

```bash
passwd -l username
```

---

### Q13

How would you verify a user belongs to the docker group?

```bash
groups username
```

---

### Q14

How would you onboard a new developer automatically?

Answer:

```text
Create Group

Create User

Assign Group

Create Home Directory

Verify Configuration
```

---

# Deliverables

```text
create_user.sh

delete_user.sh

user_exists.sh

add_user_to_group.sh

bulk_user_creation.sh

user_lock.sh

user_unlock.sh

user_info.sh

user_provisioning.sh
```

These scripts cover the majority of Linux User Management questions typically asked in DevOps and Cloud Engineer interviews.
