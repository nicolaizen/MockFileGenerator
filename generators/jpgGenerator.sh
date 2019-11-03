#!/bin/bash
testFilesDir="./testfiles/jpg/"

createNoiseJpg () {
  mx=$((172*"$1"))
  my=3330

  head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- "$testFilesDir$1$2".jpg
}

main () {
  testFilesDir="../testfiles/jpg/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNoiseJpg "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi