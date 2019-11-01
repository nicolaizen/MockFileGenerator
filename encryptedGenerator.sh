#!/bin/bash

createEncryptedFile () {
    dd if=/dev/urandom of="tmp".bin count=$(( $1 * 1000 )) bs=1000
    gpg -e -r MockFileGenerator@protonmail.com --output "./encrypted/$1"MB.encrypted tmp.bin
    rm tmp.bin
}

if [ -z "$(gpg --list-public-keys | grep MockFileGenerator@protonmail.com)" ]; then
    echo MockFileGenerator@protonmail.com not included in publicKeys.
    exit 1
fi

mkdir -p encrypted
source ./sequenceFunction.sh
runFunctionSequenced "${0##*/}" createEncryptedFile "$@"