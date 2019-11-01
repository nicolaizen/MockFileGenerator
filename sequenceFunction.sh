#!/bin/bash

# Arguments: $1=Name of calling file.
#            $2=Function to be called.
#            $3->5=seq inputs.
function runFunctionSequenced() {
  generatorOrigin="$1"
  generatorMethod="$2"
  sizeIncrement=1
  sizeTo="$3"

  if [ -z "$3" ]
    then
      printf "Usage: %s [OPTION]... LAST\n" "$generatorOrigin"
      printf "   or: %s [OPTION]... FIRST LAST\n" "$generatorOrigin"
      printf "   or: %s [OPTION]... FIRST INCREMENT LAST\n" "$generatorOrigin"
    else
      if [ "$#" -eq 4 ]; then
        sizeTo="$4"
      fi

      if [ "$#" -eq 5 ]; then
        sizeIncrement="$4"
        sizeTo="$5"
      fi

      for i in $(seq "$3" "$sizeIncrement" "$sizeTo")
      do
        $generatorMethod "$i"
      done
  fi
}