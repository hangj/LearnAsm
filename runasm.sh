#!/usr/bin/env bash

# file=$1
# nasm -f elf64 -o $file.o $file && # double ampersand (&&). This means that the script should only continue if this command is successful
# ld -o $file.out $file.o &&
# rm $file.o &&
# ./$file.out
# echo $?
# rm $file.out


# mac
# nasm -f macho64 $file
# ld -lSystem -e _start $file.o
# ./a.out

file=$1

OS=`uname`

format=""
linklibrary=""

if [ "$OS" = "Linux" ]; then
    format=elf64
elif [ "$OS" = "Darwin" ]; then
    format=macho64
    linklibrary="-lSystem"
else
    echo "OS must be Linux or Darwin"
    exit 1
fi

nasm -f $format -o $file.o $file &&
ld -o $file.out -e _start $linklibrary $file.o &&
rm $file.o
./$file.out
echo $?
rm $file.out

