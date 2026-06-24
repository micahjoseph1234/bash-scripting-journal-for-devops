#!/bin/bash

read -p "Enter directory path: " dirpath

if [ -d "$dirpath" ]
then
        echo "Directory exists"

        find "$dirpath" -type f -mtime +30 -delete

        if [ $? -eq 0 ]
        then
                echo "Log cleanup successful"
                exit 0
        else
                echo "Log cleanup failed"
                exit 1
        fi
else
        echo "Directory does not exist"
        exit 1
fi
