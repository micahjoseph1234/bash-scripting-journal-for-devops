```bash
#!/bin/bash

# ==========================================================
# DAY 10
# BACKUP ROTATION SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# Production servers generate backups daily.
#
# Example:
#
# /opt/backups
#
# backup_20260620.tar.gz
# backup_20260621.tar.gz
# backup_20260622.tar.gz
# backup_20260623.tar.gz
#
# Over time these backups consume disk space.
#
# Requirement:
#
# Keep only the last 7 days of backups and
# delete older backup files automatically.
#
# REQUIREMENTS:
#
# 1. Accept backup directory.
# 2. Verify directory exists.
# 3. Find .tar.gz files older than 7 days.
# 4. Delete old backup files.
# 5. Display success/failure message.
#
# CONCEPTS:
#
# read -p
# -d
# find
# -name
# -mtime
# -delete
# $?
# exit codes
#
# ==========================================================

read -p "Enter backup directory: " dirname

if [ -d "$dirname" ]
then
        echo "Directory exists."

        find "$dirname" -name "*.tar.gz" -mtime +7 -delete

        if [ $? -eq 0 ]
        then
                echo "Backup rotation completed successfully."
                exit 0
        else
                echo "Backup rotation failed."
                exit 1
        fi
else
        echo "Directory does not exist."
        exit 1
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# find "$dirname" -name "*.tar.gz" | -mtime +7 -delete
#
# WHY?
# | is a pipe operator.
# -mtime and -delete are not separate commands.
#
# CORRECT
# find "$dirname" -name "*.tar.gz" -mtime +7 -delete

# WRONG
# find "$dirname" -name *.tar.gz
#
# WHY?
# Shell may expand * before find runs.
#
# CORRECT
# find "$dirname" -name "*.tar.gz"

# WRONG
# rm -rf "$dirname"
#
# WHY?
# Dangerous. Deletes entire directory.
#
# CORRECT
# find "$dirname" -name "*.tar.gz" -mtime +7 -delete

# WRONG
# echo "Directory does not exist
#
# WHY?
# Missing closing quote.
#
# CORRECT
# echo "Directory does not exist"

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. What does:
#
# -name "*.tar.gz"
#
# do?
#
# Searches for files ending with .tar.gz.

# Q2. What does:
#
# -mtime +7
#
# mean?
#
# Files modified more than 7 days ago.

# Q3. Why are quotes used?
#
# "*.tar.gz"
#
# Prevent shell expansion before find executes.

# Q4. Difference:
#
# find -delete
# rm -rf
#
# find -delete -> Deletes only matching files.
# rm -rf       -> Recursive delete, dangerous.

# Q5. Why perform backup rotation?
#
# Prevent disk full issues and manage storage.

# ==========================================================
# REAL WORLD USE CASES
# ==========================================================
#
# Database backup cleanup
# Application backup cleanup
# Log archive cleanup
# S3 sync staging cleanup
# Server housekeeping automation
#
# ==========================================================
# KEY TAKEAWAY
# ==========================================================
#
# find "$dirname" -name "*.tar.gz" -mtime +7 -delete
#
# Find all backup archives older than 7 days
# and delete them automatically.
#
# One of the most common production housekeeping
# commands used by Linux and DevOps engineers.
# ==========================================================
```
