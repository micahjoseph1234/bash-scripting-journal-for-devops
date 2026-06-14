#!/bin/bash

echo "Checking Git Installation..."

if command -v git >/dev/null 2>&1
then
    echo "Git already installed"
else
    echo "Installing Git..."
    sudo apt update -y
    sudo apt install git -y
fi

echo "Git Version:"
git --version
