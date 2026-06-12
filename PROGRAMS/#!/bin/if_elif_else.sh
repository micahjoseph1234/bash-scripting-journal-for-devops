#!/bin/bash
#
echo -n "Enter a number: "
read NUM										# 200 Scenarios

if [ $NUM -gt 0 ]
then
	echo "$NUM is +ve"
elif [ $NUM -lt 0 ]
then
    echo "$NUM is -ve"
else
    echo "$NUM is 0"
fi

echo "done"


