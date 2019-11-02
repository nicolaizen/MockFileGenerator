#!/bin/bash
testFilesDir="./testfiles/7z/"

create7zFile () {
  base64 /dev/urandom | head -c $(( $1 * 1300857 )) > fileToArchive.txt
  7z a "$testFilesDir$1$2".7z fileToArchive.txt
  rm fileToArchive.txt
}

main () {
  testFilesDir="../testfiles/7z/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" create7zFile "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi



