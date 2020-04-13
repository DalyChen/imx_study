name=$1
make
mv *.o *.elf *.bin ./build/
cp ./build/${name}.bin ../download_tool/
