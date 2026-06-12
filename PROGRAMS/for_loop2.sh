#!/bin/bash

COUNT=0

for ((i = 0; i < 5; i++))
do
    echo "Loop count is ${COUNT}"
    COUNT=$((COUNT + 1))
done
