#!/bin/bash

echo "Checking Maven Installation..."

if command -v mvn >/dev/null 2>&1
then
    echo "Maven already installed"
else
    echo "Installing Maven..."
    sudo apt update -y
    sudo apt install maven -y
fi

echo "Maven Version:"
mvn --version
