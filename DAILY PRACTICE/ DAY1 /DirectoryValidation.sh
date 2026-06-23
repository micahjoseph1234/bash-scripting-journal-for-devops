#!/bin/bash

# ==========================================================
# DAY 1 - SCRIPT 2
# DIRECTORY EXISTS CHECKER
# ==========================================================
#
# PROBLEM STATEMENT:
#
# Before storing backups/logs,
# verify whether directory exists.
#
# If directory exists:
#   Print success message
#
# If directory does not exist:
#   Create directory automatically
#
# Return appropriate exit code.
#
# CONCEPTS:
# read -p
# -d
# mkdir -p
# $?
#
# ==========================================================

read -p "Enter directory name: " dirname

if [ -d "$dirname" ]
then
    echo "Directory already exists"
    exit 0
else
    echo "Directory does not exist"

    mkdir -p "$dirname"

    if [ $? -eq 0 ]
    then
        echo "Directory created successfully"
        exit 0
    else
        echo "Directory creation failed"
        exit 1
    fi
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# mkdir "$dirname"
#
# WHY?
# Fails if directory already exists
#
# BETTER
# mkdir -p "$dirname"

# WRONG
# if [-d "$dirname" ]
#
# WHY?
# Missing spaces
#
# CORRECT
# if [ -d "$dirname" ]

# WRONG
# $dirname
#
# BETTER
# "$dirname"
#
# WHY?
# Handles spaces safely
#
# Example:
# backup files
