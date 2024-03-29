#!/bin/bash
testFilesDir="./testfiles/gpg/"

createEncryptedFile () {
    dd if=/dev/urandom of="tmp".bin count=$(( $1 * 1000 )) bs=1000
    gpg -e -r MockFileGenerator@protonmail.com --output "$testFilesDir$1$2".gpg tmp.bin
    rm tmp.bin
}

if [ -z "$(gpg --list-public-keys | grep MockFileGenerator@protonmail.com)" ]; then
    printf "MockFileGenerator@protonmail.com not included in gpg --list-public-keys.\nAdd it through the following command:\ngpg --import public-key.gpg"
    exit 1
fi

main () {
  testFilesDir="../testfiles/gpg/"
  mkdir -p $testFilesDir
  source ./sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createEncryptedFile "$@"
}

if [ -n "$1" ]; then
  main "$@"
fi