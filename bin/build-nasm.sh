#!/usr/bin/env bash

echo "Building $1"
nasm -felf64 $1 -o program.o
ld -o program program.o
