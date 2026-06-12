#!/bin/bash
echo -n "Enter number 1 : " # -n option supresses newline
read NUM1 # Read the user input from Standard Input and store in Variable NUM1

echo -n "Enter number 2 : "
read NUM2

SUM=$(($NUM1 + $NUM2)) # Arithmetic expansion using double parentheses
echo "The sum is $SUM"

