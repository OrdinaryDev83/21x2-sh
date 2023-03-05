#!/bin/sh

while IFS= read line
do
    ( echo "$line" | grep -qP "^[\t' ''']*$" && echo "it is empty" ) || ( echo "$line" | grep -q "^[a-zA-Z][a-zA-Z]*$" && echo "it is a word" ) || ( echo "$line" | grep -q "^[0-9]$" && echo "it is a digit" ) || ( echo "$line" | grep -q "^[0-9][0-9]*$" && echo "it is a number" ) || ( echo "$line" | grep -q "^[a-zA-Z0-9]*$" && echo "it is an alphanum" ) || ( echo "it is too complicated" && exit 0 )
done
