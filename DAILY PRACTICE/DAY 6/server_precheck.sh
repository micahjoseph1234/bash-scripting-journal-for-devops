#!/bin/bash

# ==========================================================
# DAY 6
# SERVER PRECHECK SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# Before deployment or maintenance,
# Operations team wants a quick health report.
#
# REQUIREMENTS:
#
# 1. Display Hostname
# 2. Display Current User
# 3. Display Current Date
# 4. Display Disk Usage
# 5. Display Memory Usage
# 6. Display NGINX Status
#
# CONCEPTS:
#
# hostname
# whoami
# date
# df
# free
# awk
# tr
# systemctl
# $(( ))
#
# ==========================================================

echo "===== SERVER PRECHECK ====="

hostname=$(hostname)
user=$(whoami)
today=$(date)

disk=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

total=$(free -m | awk 'NR==2 {print $2}')
used=$(free -m | awk 'NR==2 {print $3}')

memory=$(( used * 100 / total ))

status=$(systemctl is-active nginx)

echo "Hostname      : $hostname"
echo "User          : $user"
echo "Date          : $today"
echo "Disk Usage    : $disk%"
echo "Memory Usage  : $memory%"
echo "NGINX Status  : $status"

echo "===== PRECHECK COMPLETE ====="

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# free -m | awk 'NR==1'
#
# CORRECT
# free -m | awk 'NR==2'

# WRONG
# memory=( used * 100 / total )
#
# CORRECT
# memory=$(( used * 100 / total ))

# WRONG
# systemctl status nginx
#
# BETTER
# systemctl is-active nginx

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. Difference:
#
# hostname
# whoami
#
# hostname -> Server name
# whoami   -> Logged in user

# Q2. Why use free -m ?
#
# Displays memory in MB.

# Q3. Why use $(( )) ?
#
# Arithmetic calculations.

# ==========================================================
# KEY TAKEAWAY
# ==========================================================
#
# memory=$(( used * 100 / total ))
#
# Calculate percentage using shell arithmetic.
