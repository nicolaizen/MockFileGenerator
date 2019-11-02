#!/bin/bash
testFilesDir="./testfiles/pdf/"

createNoisePdf () {
  mx=$((100*"$1"))
  my=3333

  head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- "$testFilesDir$1$2".pdf
}

main () {
  testFilesDir="../testfiles/pdf/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNoisePdf "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi