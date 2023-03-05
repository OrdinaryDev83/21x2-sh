#!/bin/sh

if [ $# -ne 1 ]
then
    exit
fi

for i in "$1"/*
do
    file $i | grep "ASCII"
done
