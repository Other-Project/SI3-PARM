#!/bin/bash
clang -S -target arm-none-eabi -mcpu=cortex-m0 -O0 -mthumb -nostdlib -I./include ${1}
../Assembler -d ${1%.c}.s
