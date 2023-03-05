#!/bin/sh

while [ $# -gt 0 ];
do
    echo -n $1 | tr -d [rR]

    [ $# -gt 1 ] && echo -n ","
    shift
done
echo ""
