#!/bin/sh

if [ $# -ne 1 ]
then
    exit 1
fi

if [ -r $1 ]
then
    while IFS= read -r line;
    do
        nbcar=${#line}
        [ $nbcar -ge 80 ] && printf "%s\n" "$line"
    done < "$1"
    exit 0
fi

exit 1
