#!/bin/bash

createNoisePdf () {
  mx=$((100*"$1"))
  my=3333

  head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- "testfiles/pdf/$1$2".pdf
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

mkdir -p testfiles/pdf
source ./sequenceFunction.sh
runFunctionSequenced "${0##*/}" createNoisePdf "$@"

printf "Created files are owned by root, change that by command:\nsudo chown -R \$USER:\$USER ./testfiles/pdf\n"