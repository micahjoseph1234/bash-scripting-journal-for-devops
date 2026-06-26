#!/bin/bash

# ==========================================================
# DAY 4
# USER CREATION SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# HR requests creation of a new Linux user.
#
# Before creating the user:
#
# 1. Accept username from user.
# 2. Check whether user already exists.
# 3. If user exists, do not create again.
# 4. If user does not exist, create user.
# 5. Display success/failure message.
#
# CONCEPTS:
#
# read -p
# id
# useradd
# -m
# -d
# -s
# $?
# >/dev/null 2>&1
# exit 0
# exit 1
#
# ==========================================================

read -p "Enter username: " username

if id "$username" >/dev/null 2>&1
then
        echo "User already exists."
        exit 0
else
        sudo useradd -m -d "/home/$username" -s /bin/bash "$username"

        if [ $? -eq 0 ]
        then
                echo "User created successfully."
                exit 0
        else
                echo "User creation failed."
                exit 1
        fi
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# if id "$username"
#
# WHY?
# Prints unnecessary output.
#
# CORRECT
# if id "$username" >/dev/null 2>&1

# WRONG
# useradd "$username" -s /bin/bash -m -d /home/name
#
# WHY?
# Home directory becomes literally /home/name
#
# CORRECT
# useradd -m -d "/home/$username" -s /bin/bash "$username"

# WRONG
# if [ $? -eq 0 ]
#     echo "Success"
#
# WHY?
# Missing then
#
# CORRECT
#
# if [ $? -eq 0 ]
# then
#     echo "Success"
# fi

# WRONG
# exit 0 before processing completes.
#
# WHY?
# Script terminates immediately.

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. What does id command do?
#
# Checks whether a Linux user exists.

# Q2. Why >/dev/null 2>&1 ?
#
# Suppresses stdout and stderr.
# Only exit status is checked.

# Q3. What does -m do?
#
# Creates home directory.

# Q4. What does -d do?
#
# Specifies custom home directory.

# Q5. What does -s do?
#
# Specifies login shell.

# ==========================================================
# KEY TAKEAWAY
# ==========================================================

# id "$username" >/dev/null 2>&1
#
# Check if user exists without printing output.

# useradd -m -d "/home/$username" -s /bin/bash "$username"
#
# Production way of creating a Linux user.
