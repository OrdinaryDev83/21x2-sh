#!/bin/sh

if [ $# -ne 2 ]; then
    >&2 echo "Usage: extchange.sh 'ext1' 'ext2'"
    exit 1
fi

f123456789=0
for f123456789f in $(echo *); do
    case $f123456789f in
        *.$1)
            f123456789n=$(echo $f123456789f | cut -d. -f1)
            echo "mv $f123456789f $f123456789n.$2"
            mv $f123456789f $f123456789n.$2
            f123456789=$(($f123456789+1))
            ;;
    esac
done

if [ $f123456789 -eq 0 ]; then
    exit 2
fi
