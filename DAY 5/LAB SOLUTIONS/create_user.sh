#!/bin/bash

read -p "Enter Username: " name

if id "$name" >/dev/null 2>&1
then
    echo "User $name already exists"
else
    sudo useradd -m -s /bin/bash "$name"

    if [ $? -eq 0 ]
    then
        echo "User $name created successfully"
    else
        echo "User creation failed"
    fi
fi

id "$name"
