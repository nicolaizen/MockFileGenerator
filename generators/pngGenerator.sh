#!/bin/bash
testFilesDir="./testfiles/png/"

createNoisePng () {
  mx=$((100*"$1"))
  my=3333

  head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- "$testFilesDir$1$2".png
}

main () {
  testFilesDir="../testfiles/png/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNoisePng "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi