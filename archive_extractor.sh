#!/bin/bash

if [[ -z $1 ]] ; then
    printf "Read github docs: https://github.com/rysndavjd/archive_extracter\n"
    exit 0
fi

FILE=$1
OUT=$2
TYPE=$(file --brief $FILE)
CPWD=$(pwd)

extract() {
    if [[ $(basename $FILE) == .* ]]; then
        file=$(basename $FILE)
        file=${file#.}
        file=${file%.*}
        mkdir -p "$OUT/.$file"
        printf "$OUT/.$file"
    else
        file=$(basename $FILE)
        file=${file%.*}
        mkdir -p "$OUT/$file"
        printf "$OUT/$file"
    fi
}

case "$TYPE" in 
    *Zip*)
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
    *gzip*) 
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
    *tar\ archive*) 
        out_file=$(extract)
        cd "$out_file"
        tar -xf "$FILE" --overwrite
        cd $CPWD
    ;;
    *7-zip*)
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
    *RAR*)
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
esac