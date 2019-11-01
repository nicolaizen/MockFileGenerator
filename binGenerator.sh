#!/bin/bash

createNullFile () {
  dd if=/dev/zero of="bin/$1"MB.bin count=$(( $1 * 1000 )) bs=1000
}

mkdir -p bin
source ./sequenceFunction.sh
runFunctionSequenced "${0##*/}" createNullFile "$@"