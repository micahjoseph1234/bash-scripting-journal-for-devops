#!/bin/bash

echo -n "Enter a NUM: "
read NUM

# Check whether a number is between 10 and 20 (Using AND -a operator)
if [ $NUM -ge 10 -a $NUM -le 20 ]
then
    echo "$NUM is between 10 and 20"
else
    echo "$NUM is NOT between 10 and 20"
fi

echo -n "Enter another NUM: "
read NUM

# Check whether a number is between 10 and 20 (Using OR -o operator)
if [ $NUM -lt 10 -o $NUM -gt 20 ]
then
    echo "$NUM is NOT between 10 and 20"
else
    echo "$NUM is between 10 and 20"
fi
