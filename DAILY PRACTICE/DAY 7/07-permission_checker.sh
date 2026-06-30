#!/bin/bash

# ==========================================================
# DAY 7
# PERMISSION CHECKER SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# Deployment scripts often fail with:
#
# Permission denied
#
# Create a script that:
#
# 1. Accepts filename.
# 2. Verifies file exists.
# 3. Displays permissions.
# 4. Checks whether file is executable.
# 5. Adds execute permission if missing.
#
# CONCEPTS:
#
# -f
# -x
# ls -l
# chmod
# exit codes
#
# ==========================================================

read -p "Enter filename: " filename

if [ -f "$filename" ]
then
        echo "File exists."

        ls -l "$filename"

        if [ -x "$filename" ]
        then
                echo "File is already executable."
                exit 0
        else
                chmod +x "$filename"

                if [ $? -eq 0 ]
                then
                        echo "Execute permission added."
                        exit 0
                else
                        echo "Failed to add execute permission."
                        exit 1
                fi
        fi
else
        echo "File not found."
        exit 1
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# if -f "$filename"
#
# CORRECT
# if [ -f "$filename" ]

# WRONG
# if -x "$filename"
#
# CORRECT
# if [ -x "$filename" ]

# WRONG
# chmod +x filename
#
# CORRECT
# chmod +x "$filename"

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. Difference:
#
# chmod
# chown
#
# chmod -> Change permissions
# chown -> Change ownership

# Q2. What does:
#
# chmod +x
#
# do?
#
# Adds execute permission.

# Q3. Meaning of:
#
# -rwxr-xr-x
#
# Owner  -> rwx
# Group  -> r-x
# Others -> r-x

# ==========================================================
# KEY TAKEAWAY
# ==========================================================
#
# [ -x "$filename" ]
#
# Checks whether a file is executable.
