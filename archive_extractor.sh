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
        #if [[ $(basename $FILE) == .* ]]; then
        #    file=$(basename $FILE)
        #    file=${file#.}
        #    file=${file%.*}
        #    mkdir -p "$OUT/.$file"
        #    7zz -y x "$FILE" -o"$OUT/.$file"
        #else
        #    file=$(basename $FILE)
        #    file=${file%.*}
        #    mkdir -p "$OUT/$file"
        #    7zz -y x "$FILE" -o"$OUT/$file"
        #fi
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
    *gzip*) 
        #if [[ $(basename $FILE) == .* ]]; then
        #    file=$(basename $FILE)
        #    file=${file#.}
        #    file=${file%.*}
        #    mkdir -p "$OUT/.$file"
        #    7zz -y x "$FILE" -o"$OUT/.$file"
        #else
        #    file=$(basename $FILE)
        #    file=${file%.*}
        #    echo "$OUT/$file"
        #    mkdir -p "$OUT/$file"
        #    7zz -y x "$FILE" -o"$OUT/$file"
        #fi
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
    *tar\ archive*) 
        #if [[ $(basename $FILE) == .* ]]; then
        #    file=$(basename $FILE)
        #    file=${file#.}
        #    file=${file%.*}
        #    mkdir -p "$OUT/.$file"
        #    cd "$OUT/$file"
        #    tar -xf "$FILE" --overwrite
        #    cd $CPWD
        #else
        #    file=$(basename $FILE)
        #    file=${file%.*}
        #    mkdir -p "$OUT/$file"
        #    cd "$OUT/$file"
        #    tar -xf "$FILE" --overwrite
        #    cd $CPWD
        #fi
        out_file=$(extract)
        cd "$out_file"
        tar -xf "$FILE" --overwrite
        cd $CPWD
    ;;
    *7-zip*)
        #if [[ $(basename $FILE) == .* ]]; then
        #    file=$(basename $FILE)
        #    file=${file#.}
        #    file=${file%.*}
        #    mkdir -p "$OUT/.$file"
        #    7zz -y x "$FILE" -o"$OUT/.$file"
        #else
        #    file=$(basename $FILE)
        #    file=${file%.*}
        #    mkdir -p "$OUT/$file"
        #    7zz -y x "$FILE" -o"$OUT/$file"
        #fi
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
    *RAR*)
        #if [[ $(basename $FILE) == .* ]]; then
        #    file=$(basename $FILE)
        #    file=${file#.}
        #    file=${file%.*}
        #    mkdir -p "$OUT/.$file"
        #    7zz -y x "$FILE" -o"$OUT/.$file"
        #else
        #    file=$(basename $FILE)
        #    file=${file%.*}
        #    mkdir -p "$OUT/$file"
        #    7zz -y x "$FILE" -o"$OUT/$file"
        #fi
        out_file=$(extract)
        7zz -y x "$FILE" -o"$out_file"
    ;;
esac