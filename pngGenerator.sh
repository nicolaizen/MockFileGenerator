#!/bin/bash

#Bin="Binaryfil for testing innad team arkiv og digitale forsendelser." 64x3 bytes stor

mx=1000
my=1000
bytesRequired="$((3*"$mx"*"$my"))"
ratioString="${mx}x${my}"
binCopies="$(( "$bytesRequired" / 15552 + 1 ))"

echo "binCopies: $binCopies"

printf "Creating PNG with size: %s from %s bytes.\n" ${ratioString} ${bytesRequired}

for _ in $(seq 1 1 "$binCopies"); do head -c $bytesRequired pngSource.bin; done > tmp.bin
head -c $bytesRequired tmp.bin | convert -depth 8 -size $ratioString RGB:- random.png
rm tmp.bin