#!/bin/bash
testFilesDir="./testfiles/zip/"

createZipFile () {
  base64 /dev/urandom | head -c $(( $1 * 1315789 )) > fileToArchive.txt
  zip -r "$testFilesDir$1$2".zip fileToArchive.txt
  rm fileToArchive.txt
}

main () {
  testFilesDir="../testfiles/zip/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createZipFile "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi