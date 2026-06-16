#!/bin/bash

read -p "Enter Username: " name

if id "$name" >/dev/null 2>&1
then
    echo "User exists"
    id "$name"
else
    echo "User does not exist"
fi
