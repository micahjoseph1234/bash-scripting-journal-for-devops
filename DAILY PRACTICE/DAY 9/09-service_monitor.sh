#!/bin/bash

# ==========================================================
# DAY 9
# SERVICE MONITOR SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# PagerDuty alerts:
#
# NGINX is down.
#
# Create a script that:
#
# 1. Accepts service name.
# 2. Checks if service is running.
# 3. If DOWN, restart it.
# 4. Verify service again.
#
# CONCEPTS:
#
# read -p
# systemctl is-active --quiet
# systemctl restart
# exit codes
#
# ==========================================================

read -p "Enter service name: " servicename

if systemctl is-active --quiet "$servicename"
then
        echo "$servicename is UP"
        exit 0
else
        echo "$servicename is DOWN"
        echo "Attempting restart..."

        sudo systemctl restart "$servicename"

        if systemctl is-active --quiet "$servicename"
        then
                echo "Restart successful."
                echo "$servicename is UP"
                exit 0
        else
                echo "Restart failed."
                echo "$servicename is still DOWN"
                exit 1
        fi
fi

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# status=$(systemctl status nginx)
#
# BETTER
# systemctl is-active --quiet nginx

# WRONG
# if [ $? -eq Running ]
#
# CORRECT
# if [ $? -eq 0 ]

# WRONG
# if ( status -eq "Running" )
#
# CORRECT
# if systemctl is-active --quiet nginx

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. Difference:
#
# systemctl status
# systemctl is-active
#
# status    -> Human readable output
# is-active -> Script friendly.

# Q2. Difference:
#
# start
# stop
# restart
# enable
# disable

# Q3. Why verify after restart?
#
# Restart command may succeed,
# but service may still fail to start.

# ==========================================================
# KEY TAKEAWAY
# ==========================================================
#
# if systemctl is-active --quiet "$servicename"
#
# Best way to check service health inside scripts.
