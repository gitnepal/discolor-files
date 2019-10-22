#!/bin/bash
# Alpha Bro Here :3
#Dependencies : sponge
#apt-get install moreutils
TARGET="$1"
CURRENT_PATH=$(pwd)


if [ -z $TARGET ]; then
  	echo ""
	echo -e " [-] Usage: discolor.sh <filename> "
	exit
fi

if [[ $TARGET == "--help" ]] || [[ $TARGET == "-h" ]]; then
    echo ""
    echo -e " [+] Remove color from shell scripts/logfiles "
	echo -e " [-] Get Plain Text : discolor.sh <files> "
    exit
fi

if [ ! -f $TARGET ]; then
    echo -e " [+] ---------  File Not Found -------------- [+] "
    echo -e " [+] ---------  Check - FILE PATH -------------- [+] "
    exit
fi

createdir=$(mkdir -p "$CURRENT_PATH/tmp/")
FILENAME=$( basename $TARGET )
echo -e " + ------------------------------=[Work going on ]=-------------- +"
echo -e ""
strings $TARGET | sponge $TARGET
file=$(cat $TARGET | sed 's/\[[0-9;]*m//g' | tee -a tmp/$FILENAME)
echo -e " + ------------------------------=[CHECK FILE tmp/$FILENAME ]=-------------- +"
echo "DONE"
