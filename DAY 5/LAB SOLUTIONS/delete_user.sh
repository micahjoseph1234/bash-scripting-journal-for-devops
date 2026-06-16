#!/bin/bash

read -p "Enter Username: " name

if id "$name" >/dev/null 2>&1
then
    sudo userdel -r "$name"

    if [ $? -eq 0 ]
    then
        echo "User deleted successfully"
    else
        echo "User deletion failed"
    fi
else
    echo "User does not exist"
fi
