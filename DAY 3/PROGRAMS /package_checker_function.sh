#!/bin/bash

check_package()
{
    if command -v $1 >/dev/null 2>&1
    then
        echo "$1 Installed"
    else
        echo "$1 Not Installed"
    fi
}

check_package git
check_package java
check_package mvn
