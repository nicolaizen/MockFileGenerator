#!/bin/bash

RED='\033[0;41;30m'
STD='\033[0;0;39m'
from=1
increment=1
to=1

reset_span() {
  from=1
  increment=1
  to=1
}

show_banner() {
  clear
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "$1"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~"
}

show_choose_size_single_menus() {
	show_banner "     SELECT FILE SIZE     "
	read -p "Enter file size in MB(Int) or !Int to exit: " from
}

show_choose_amount_fixed_size_menus() {
	show_banner "      SELECT AMOUNT       "
	printf "Size selected.\n"
	read -p "Enter number of samples to create(Int) or !Int to exit: " to
}

show_choose_from_size_menus() {
	show_banner "    SELECT RANGE (FROM)   "
	printf "We are about to create multiple files with increasing size.\nSpecify the span in file size starting with lowest value.\n"
  read -p "Enter start of range in MB(INT) or !Int to exit: " from
}

show_choose_increment_size_menus() {
	show_banner " SELECT RANGE (INCREMENT) "
	printf "Start of range chosen.\nNow specify the increment in file size between each sample.\n"
  read -p "Enter incremental step in MB(INT) or !Int to exit: " increment
}

show_choose_to_size_menus() {
	show_banner "    SELECT RANGE (TO)     "
	printf "Start range and step chosen.\nNow specify the largest file in the range.\n"
  read -p "Enter final size in MB(INT) or !Int to exit: " to
}

show_choose_behaviour_menus() {
  show_banner  "      SELECT ACTION       "
	echo "1. Create Single File"
	echo "2. Create Multiple Files Of Fixed Size"
	echo "3. Create Multiple Files Of Incrementing Size"
	echo "q | x. Exit"
}

read_behaviour_options() {
	local choice
	read -p "Enter choice [ 1 - 3 ] " choice
	case $choice in
		1) show_choose_size_single_menus ;;
		2) show_choose_size_single_menus &&
		   show_choose_amount_fixed_size_menus &&
		   increment=0;;
		3) show_choose_from_size_menus &&
		   show_choose_increment_size_menus &&
		   show_choose_to_size_menus;;
    'q') exit 0;;
		'x') exit 0;;
		*) echo -e "${RED}Invalid option... Try again${STD}" && sleep 1
	esac
}

setup_amounts() {
  show_choose_behaviour_menus
  read_behaviour_options
}

pause() {
  reset_span
  read -p "Press [Enter] key to continue..." _
}

binaryFiles() {
  setup_amounts

  mkdir -p ./testfiles/bin
  source ./generators/binGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNullFile "$from" "$increment" "$to"

	pause
}

gpgFiles() {
	setup_amounts

	mkdir -p ./testfiles/gpg
  source ./generators/gpgGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createEncryptedFile "$from" "$increment" "$to"

  pause
}

pdfFiles() {
	setup_amounts

	mkdir -p ./testfiles/pdf
  source ./generators/pdfGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNoisePdf "$from" "$increment" "$to"

  pause
}

pngFiles() {
	setup_amounts

	mkdir -p ./testfiles/png
  source ./generators/pngGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createNoisePng "$from" "$increment" "$to"

  pause
}

txtFiles() {
	setup_amounts

	mkdir -p ./testfiles/txt
  source ./generators/txtGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createTxtFile "$from" "$increment" "$to"

  pause
}

zipFiles() {
	setup_amounts

	mkdir -p ./testfiles/zip
  source ./generators/zipGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" createZipFile "$from" "$increment" "$to"

  pause
}


7zFiles() {
	setup_amounts

	mkdir -p ./testfiles/7z
  source ./generators/7zGenerator.sh
  source ./generators/sequenceFunction.sh
  runFunctionSequenced "${0##*/}" create7zFile "$from" "$increment" "$to"

  pause
}

show_main_menus() {
	show_banner "     M A I N - M E N U    "
	echo "1. Create BINARY Files"
	echo "2. Create GPG ENCRYPTED Files"
	echo "3. Create PDF Files (Might require Sudo)"
	echo "4. Create PNG Files"
	echo "5. Create TXT Files"
	echo "6. Create ZIP Files"
	echo "7. Create 7Z  Files"
	echo "q | x. Exit"
	echo "d. Deletes generated files"
}

read_main_options() {
	local choice
	read -p "Enter choice [ 1 - 6 ] " choice
	case $choice in
		1) binaryFiles ;;
		2) gpgFiles ;;
		3) pdfFiles ;;
		4) pngFiles ;;
		5) txtFiles ;;
		6) zipFiles ;;
		7) 7zFiles ;;
		'q') exit 0;;
		'x') exit 0;;
		'd') rm -rf testfiles ;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
	show_main_menus
	read_main_options
done
