#!/bin/bash

check_and_install()
{
    if command -v $1 >/dev/null 2>&1
    then
        echo "$1 already installed"
    else
        echo "Installing $2..."
        sudo apt install $2 -y
    fi
}

check_and_install git git
check_and_install java default-jdk
check_and_install mvn maven

echo ""
echo "Installed Versions"

git --version
java --version
mvn --version
