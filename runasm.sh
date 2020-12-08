#!/usr/bin/env bash

file=$1
nasm -f elf64 -o $file.o $file &&
ld -o $file.out $file.o &&
rm $file.o &&
./$file.out
echo $?
rm $file.out

