#!/bin/bash

createNoisePng () {
  mx=$((100*"$1"))
  my=3333

  head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- "png/$1"MB.png
}

mkdir -p png
source ./sequenceFunction.sh
runFunctionSequenced "${0##*/}" createNoisePng "$@"