#!/bin/bash
testFilesDir="./testfiles/bin/"

createNullFile () {
  dd if=/dev/zero of="$testFilesDir$1$2".bin count=$(( $1 * 1000 )) bs=1000
}

main () {
  testFilesDir="../testfiles/bin/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNullFile "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi