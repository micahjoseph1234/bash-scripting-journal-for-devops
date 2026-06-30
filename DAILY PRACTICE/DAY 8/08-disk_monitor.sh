#!/bin/bash

# ==========================================================
# DAY 8
# DISK MONITOR SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# PagerDuty alerts:
#
# Disk Usage reached 90%.
#
# Create a script that:
#
# 1. Checks root filesystem usage.
# 2. If usage >= 80%
#    Print ALERT.
# 3. Otherwise print HEALTHY.
#
# CONCEPTS:
#
# df
# awk
# tr
# if
# -ge
#
# ==========================================================

usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk Usage : $usage%"

if [ "$usage" -ge 80 ]
then
        echo "ALERT : DISK USAGE EXCEEDED"
        exit 1
else
        echo "DISK USAGE HEALTHY"
        exit 0
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# [ "51%" -ge 80 ]
#
# WHY?
# Integer expression expected.

# CORRECT
# tr -d '%'

# WRONG
# df -h
#
# BETTER
# df -h /

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. What is NR in awk?
#
# Record Number.

# Q2. What is $5 ?
#
# Fifth column.

# Q3. What does:
#
# tr -d '%'
#
# do?
#
# Deletes the % character.

# Q4. Difference:
#
# -gt
# -ge
#
# -gt -> Greater than
# -ge -> Greater than or equal.

# ==========================================================
# KEY TAKEAWAY
# ==========================================================
#
# usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
#
# Extract root filesystem usage as an integer.
