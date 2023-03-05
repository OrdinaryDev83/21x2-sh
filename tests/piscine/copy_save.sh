#!/bin/sh

if [ ! -f $1 ]
then
    exit 1
fi

if [ $# -ne 1 ]
then
    echo "Usage: copy_save.sh file.csv"
    exit 1
fi

if [ ! -d "save" ]
then
    mkdir "save"
fi

OLDIFS=$IFS
IFS=","

for i in $(cat $1)
do
   if [ -f $i ]
   then
        cp $i "save/$i"
   else
        echo "$i: no such file"
        break
   fi
done < "$1"

exit 0
