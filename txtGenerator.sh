#!/bin/bash

createTxtFile () {
  base64 /dev/urandom | head -c $(( $1 * 1000000 )) > "testfiles/txt/$1$2".txt
}

mkdir -p testfiles/txt
source ./sequenceFunction.sh
runFunctionSequenced "${0##*/}" createTxtFile "$@"