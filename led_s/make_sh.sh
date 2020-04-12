#!/bin/sh
name=$1
echo "The first para is: ${name}"

arm-none-eabi-gcc -g -c ${name}.S -o ${name}.o
arm-none-eabi-ld -Ttext 0x80000000 ${name}.o -o ${name}.elf
arm-none-eabi-objcopy -O binary -S -g ${name}.elf ${name}.bin

cp ./${name}.bin ../download_tool
