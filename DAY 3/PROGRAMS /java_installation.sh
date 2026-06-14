#!/bin/bash

echo "Checking Java Installation..."

if command -v java >/dev/null 2>&1
then
    echo "Java already installed"
else
    echo "Installing Java..."
    sudo apt update -y
    sudo apt install default-jdk -y
fi

echo "Java Version:"
java --version
