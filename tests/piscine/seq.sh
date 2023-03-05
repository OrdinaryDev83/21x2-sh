#!/bin/sh

if [ ! $# -eq 3 ]
then
    >&2 echo "Usage: ./seq.sh FIRST INCREMENT LAST"
    exit 1
fi
FRST=$1
INCR=$2
LST=$3
if [ $LST -gt $FRST ] && [ $INCR -le 0 ]
then
    exit 1
elif [ $FRST -gt $LST ] && [ $INCR -ge 0 ]
then
    exit 1
fi
j=0
if [ $FRST -eq $LST ]
then
    echo "$FRST"
elif [ $LST -gt $FRST ]
then
    while [ $((FRST + INCR * j)) -le $LST ]
    do
        echo "$((FRST + INCR * j))"
        j=$((j + 1))
    done
elif [ $FRST -gt $LST ]
then
    while [ $((FRST + INCR * j)) -ge $LST ]
    do
        echo "$((FRST + INCR * j))"
        j=$((j + 1))
    done
fi
exit 0
