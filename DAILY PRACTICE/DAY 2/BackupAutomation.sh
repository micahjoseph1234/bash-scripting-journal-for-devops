#!/bin/bash

# ==========================================================
# DAY 2
# BACKUP SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# Before deployment,
# create a backup of a file.
#
# Example:
#
# nginx.conf
#
# should become:
#
# backups/nginx.conf_20260624_103000
#
# REQUIREMENTS:
#
# 1. Accept filename
# 2. Accept backup directory
# 3. Verify file exists
# 4. Create backup directory if missing
# 5. Generate timestamp
# 6. Copy file
# 7. Verify copy success
#
# CONCEPTS:
#
# read -p
# -f
# mkdir -p
# cp
# date
# command substitution
# ${variable}
# $?
#
# ==========================================================

read -p "Enter filename: " filename
read -p "Enter backup directory: " dirname

if [ ! -f "$filename" ]
then
    echo "File does not exist"
    exit 1
fi

mkdir -p "$dirname"

timestamp=$(date +%Y%m%d_%H%M)

cp "$filename" "$dirname/${filename}_${timestamp}"

if [ $? -eq 0 ]
then
    echo "Backup Successful"
    exit 0
else
    echo "Backup Failed"
    exit 1
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# timestamp=$(date + %Y%m%d_%H%M)
#
# WHY?
# Space after + breaks date format
#
# CORRECT
# timestamp=$(date +%Y%m%d_%H%M)

# WRONG
# if [-d "$dirname" ]
#
# WHY?
# Missing spaces
#
# CORRECT
# if [ -d "$dirname" ]

# WRONG
# cp "$filename" "$dirname/{$filename}_{$timestamp}"
#
# WHY?
# { } alone is not variable expansion
#
# CORRECT
# cp "$filename" "$dirname/${filename}_${timestamp}"

# WRONG
# cp "$filename" "$dirname/$filename_$timestamp"
#
# MAY CAUSE:
# Bash interprets:
# $filename_
#
# BETTER
# ${filename}_${timestamp}

# WRONG
# mkdir "$dirname"
#
# BETTER
# mkdir -p "$dirname"

# WRONG
# Not checking file existence
#
# PROBLEM:
# cp will fail later
#
# ALWAYS:
# Check file first using -f
