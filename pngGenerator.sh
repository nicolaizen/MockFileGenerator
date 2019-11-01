#!/bin/bash
outputDir="png/"

mx=$((100*"$1"))
my=3333

head -c "$((3*"$mx"*"$my"))" /dev/urandom | convert -depth 8 -size "${mx}x${my}" RGB:- $outputDir/"$1"MB.png