
# DAY 3

# LOG CLEANUP SCRIPT

# ==========================================================

#

# PROBLEM STATEMENT:

#

# Production servers continuously generate logs.

#

# Example:

#

# /var/log/nginx/access.log

# /var/log/nginx/error.log

# /app/logs/application.log

#

# Over time logs consume disk space and may

# eventually fill the filesystem.

#

# Create a script that:

#

# 1. Accepts a log directory path

# 2. Verifies directory exists

# 3. Finds files older than 30 days

# 4. Deletes old files

# 5. Displays success/failure message

#

# CONCEPTS:

#

# read -p

# -d

# find

# -type f

# -mtime +30

# -delete

# $?

# exit 0

# exit 1

#

# ==========================================================

read -p "Enter directory path: " dirpath

if [ -d "$dirpath" ]
then
echo "Directory exists"

```
    find "$dirpath" -type f -mtime +30 -delete

    if [ $? -eq 0 ]
    then
            echo "Log cleanup successful"
            exit 0
    else
            echo "Log cleanup failed"
            exit 1
    fi
```

else
echo "Directory does not exist"
exit 1
fi

# ==========================================================

# COMMON MISTAKES

# ==========================================================

# WRONG

# find -type f -mtime +30 -delete

#

# WHY?

# Searches current directory only.

#

# CORRECT

# find "$dirpath" -type f -mtime +30 -delete

# WRONG

# find "$dirpath" type -f

#

# WHY?

# Incorrect syntax.

#

# CORRECT

# find "$dirpath" -type f

# WRONG

# find "$dirpath" -type d -mtime +30

#

# WHY?

# Searches directories instead of files.

#

# CORRECT

# find "$dirpath" -type f -mtime +30

# WRONG

# Missing exit code when directory doesn't exist.

#

# PROBLEM:

# Script terminates without proper status.

#

# CORRECT

# exit 1

# WRONG

# Using rm inside a loop unnecessarily.

#

# Example:

#

# for file in *.log

# do

# rm "$file"

# done

#

# BETTER

# find "$dirpath" -type f -mtime +30 -delete

# ==========================================================

# INTERVIEW QUESTIONS

# ==========================================================

# Q1. What does find do?

#

# Searches files/directories based on conditions.

# Q2. What does -type f mean?

#

# Search only files.

# Q3. What does -type d mean?

#

# Search only directories.

# Q4. Difference between:

#

# -mtime +30

# Older than 30 days

#

# -mtime 30

# Exactly 30 days old

#

# -mtime -30

# Less than 30 days old

# Q5. Why is log cleanup important?

#

# Prevents:

# - Disk Full Issues

# - Application Failures

# - Deployment Failures

# - Server Instability

# ==========================================================

# KEY TAKEAWAY

# ==========================================================

# find "$dirpath" -type f -mtime +30 -delete

#

# Find all files older than 30 days

# and delete them.
