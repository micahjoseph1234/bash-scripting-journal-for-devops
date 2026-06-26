#!/bin/bash

# ==========================================================
# DAY 5
# BULK USER CREATION SCRIPT
# ==========================================================
#
# PROBLEM STATEMENT:
#
# HR provides a text file:
#
# users.txt
#
# micah
# john
# alice
# bob
#
# Create Linux users automatically.
#
# REQUIREMENTS:
#
# 1. Accept filename.
# 2. Verify file exists.
# 3. Read usernames one by one.
# 4. Skip existing users.
# 5. Create missing users.
# 6. Display result for every user.
#
# CONCEPTS:
#
# read -p
# while read
# done <
# id
# useradd
# if
# exit codes
#
# ==========================================================

read -p "Enter filename: " filename

if [ ! -f "$filename" ]
then
        echo "File does not exist."
        exit 1
fi

echo "Processing users..."

while read username
do
        if id "$username" >/dev/null 2>&1
        then
                echo "$username already exists."
        else
                sudo useradd -m -d "/home/$username" -s /bin/bash "$username"

                if [ $? -eq 0 ]
                then
                        echo "$username created successfully."
                else
                        echo "Failed to create $username."
                fi
        fi

done < "$filename"

echo "All users processed."

exit 0

# ==========================================================
# COMMON MISTAKES
# ==========================================================

# WRONG
# if -f "$filename"
#
# CORRECT
# if [ -f "$filename" ]

# WRONG
# done > "$filename"
#
# WHY?
# > writes to a file.
#
# CORRECT
# done < "$filename"
#
# < reads from a file.

# WRONG
# exit 0 inside while loop.
#
# WHY?
# Stops after first user.

# WRONG
# while read username
# done
#
# Missing do.
#
# CORRECT
#
# while read username
# do
#     ...
# done < "$filename"

# WRONG
# useradd "$username" -m -d /home/name
#
# WHY?
# Creates incorrect home directory.
#
# CORRECT
# useradd -m -d "/home/$username" -s /bin/bash "$username"

# ==========================================================
# INTERVIEW QUESTIONS
# ==========================================================

# Q1. Why use while read instead of for loop?
#
# Reads file line by line efficiently.

# Q2. Difference between:
#
# >
# <
#
# >  Write to file
# <  Read from file

# Q3. Why shouldn't exit be inside while loop?
#
# Script terminates after first iteration.

# Q4. Why check id before useradd?
#
# Prevent duplicate user creation.

# Q5. What does:
#
# done < users.txt
#
# mean?
#
# Feed users.txt as input to the while loop.

# ==========================================================
# KEY TAKEAWAY
# ==========================================================

# while read username
# do
#     commands
# done < users.txt
#
# Read a file line-by-line and process each record.
