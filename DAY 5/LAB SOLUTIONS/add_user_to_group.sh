#!/bin/bash

read -p "Enter Username: " name
read -p "Enter Group Name: " grpname

if ! grep "^$grpname:" /etc/group >/dev/null 2>&1
then
    echo "Creating Group..."
    sudo groupadd "$grpname"
fi

if ! id "$name" >/dev/null 2>&1
then
    echo "Creating User..."
    sudo useradd -m -s /bin/bash "$name"
fi

sudo usermod -aG "$grpname" "$name"

echo "User added to group successfully"

groups "$name"
