#!/bin/bash

NUM1=2 # Variabe assignment
NUM2=5

if [ $NUM1 -lt $NUM2 ]  # -lt is to test integer numbers
then
    echo "NUM1 < NUM2"
else
    echo "NUM1 > NUM2"
fi
