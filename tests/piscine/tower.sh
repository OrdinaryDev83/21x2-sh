#!/bin/sh

if [ "$#" -ne 2 ] || [ $1 -lt 0 ]
then
    exit 1
fi

if [ "$2" != "triangle" ] && [ "$2" != "square" ]
then
    exit 1
fi

echo " _________________"

for i in $(seq 1 $1)
do
    if [ "$2" == "square" ]
    then
        echo "|  ___       ___  |"
        echo "| |_|_|     |_|_| |"
        echo "| |_|_|     |_|_| |"
        echo "|                 |"
    else
        echo "|                 |"
        echo "|   /\       /\   |"
        echo "|  /__\     /__\  |"
        echo "|                 |"
    fi
done

echo "|        _        |"
echo "|       | |       |"
echo "|       | |       |"
echo "|       | |       |"
echo "|_______| |_______|"

exit 0
