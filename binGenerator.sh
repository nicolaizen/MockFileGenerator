#!/bin/bash
outputDir="bin/"

# Input: $1 = Megabyte
createNullFile () {
  dd if=/dev/zero of=$outputDir/"$1"MB.bin count=$(( $1 * 1000 )) bs=1000
}

createNullFiles () {
  for i in $(seq "$1" "$2" "$3")
  do
    createNullFile "$i"
  done
}

if [ -z "$1" ]
  then
    printf "Usage: binGenerator [OPTION]... LAST\n"
    printf "   or: binGenerator [OPTION]... FIRST LAST\n"
    printf "   or: binGenerator [OPTION]... FIRST INCREMENT LAST\n"
  else
    first="$1"
    increment=1
    last="$1"

    if [ "$#" -eq 2 ]; then
      last="$2"
    fi

    if [ "$#" -eq 3 ]; then
      increment="$2"
      last="$3"
    fi
    createNullFiles "$first" "$increment" "$last"
fi
