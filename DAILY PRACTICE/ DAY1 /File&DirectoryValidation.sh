#!/bin/bash

# ==========================================================
# DAY 1 - SCRIPT 1
# FILE EXISTS CHECKER
# ==========================================================
#
# PROBLEM STATEMENT:
#
# Before processing a log/configuration file,
# verify whether the file exists.
#
# If file exists:
#   Print "File exists"
#   Return exit code 0
#
# If file does not exist:
#   Print "File does not exist"
#   Return exit code 1
#
# CONCEPTS:
# read -p
# if else
# -f
# exit 0
# exit 1
#
# ==========================================================

read -p "Enter filename: " filename

if [ -f "$filename" ]
then
    echo "File exists"
    exit 0
else
    echo "File does not exist"
    exit 1
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# if df -f "$filename"
#
# WHY?
# df = disk filesystem command
# -f = file test operator
#
# CORRECT
# if [ -f "$filename" ]

# WRONG
# if[-f "$filename"]
#
# WHY?
# Spaces are mandatory
#
# CORRECT
# if [ -f "$filename" ]
