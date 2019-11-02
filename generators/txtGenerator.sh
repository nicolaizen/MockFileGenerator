#!/bin/bash
testFilesDir="./testfiles/txt/"

createTxtFile () {
  base64 /dev/urandom | head -c $(( $1 * 1000000 )) > "$testFilesDir$1$2".txt
}

main () {
  testFilesDir="../testfiles/txt/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createTxtFile "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi