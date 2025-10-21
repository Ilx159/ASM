#!/bin/bash

nasm -f bin $1 -o run.bin
qemu-system-x86_64 run.bin -nographic
