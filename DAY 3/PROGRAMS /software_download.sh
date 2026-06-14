#!/bin/bash

read -p "Enter Download URL: " url

wget "$url"

echo "Download Completed"
