#!/bin/bash
#

COUNT=0

for i in 0 1 2 3 4
do
    echo "Loop count is ${COUNT}"
    COUNT=$((COUNT + 1))
done
