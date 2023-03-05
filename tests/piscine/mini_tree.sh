#!/bin/sh

dir_count=0
file_count=0

traverse() {
  dir_count=$(($dir_count + 1))
  local directory="$1"
  local prefix="$2"
  len=0
  for j in $directory/*; do
    len=$((len + 1))
  done

  i=0

  for idx in "${directory}"/*; do 
    local child="$idx"
    child=${child##*/}

    local child_prefix="|   "
    local pointer="+-- "

    if [ $i -eq $(($len - 1)) ]; then
      pointer="+-- "
      child_prefix="    "
    fi

    i=$(($i + 1))
    [ ! "$child" = "*" ] && echo "$prefix$pointer$child"
    [ -d "$directory/$child" ] &&
      ( traverse "$directory/${child}" "${prefix}${child_prefix}" ) ||
      file_count=$((file_count + 1))
  done
}

if [ $# -eq 0 ]
then
    root="."
    [ "$#" -ne 0 ] && root="$1"
    echo "$root"
    traverse "$root" ""
else
    for i in "$@"
    do
        fe=""
        if [ ! -d "$i" ]
        then
            fe=" [error opening dir]"
            echo "$i$fe"
            continue
        fi
        echo "$i"
        traverse "$i" ""
    done
fi

# echo
# echo "$(($dir_count - 1)) directories, $file_count files"
