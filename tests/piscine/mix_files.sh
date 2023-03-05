#!/bin/sh

[ $# -ne 2 ] && >&2 echo "Usage: mix_files file1 file2" && exit 1

[ ! -f "$1" ] || [ ! -f "$2" ] && exit 1

while IFS= read -r l1234567891 && IFS= read -r l1234567892 <&3
do
    echo "$l1234567891"
    echo "$l1234567892"
done < "$1" 3< "$2"

i=$(($(wc -l < "$1") - $(wc -l < "$2")))
f123456789="$1"
if [ $i -lt 0 ]
then
    f123456789="$2"
    i=$((-i))
fi
tail --lines=$((i)) "$f123456789"
