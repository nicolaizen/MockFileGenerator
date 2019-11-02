#!/bin/bash
testFilesDir="./testfiles/pdf/"

createNoisePdf () {
  mx=$((100*"$1"))
  my=3333

  head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- "$testFilesDir$1$2".pdf
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


main () {
  testFilesDir="../testfiles/pdf/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNoisePdf "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi

printf "Created files are owned by root, change that by command:\nsudo chown -R \$USER:\$USER ../testfiles/pdf\n"