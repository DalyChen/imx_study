VPATH = start
INC = -I ../MCIMX6Y2 -I ../MCIMX6Y2/CORTEXA/Include -I ../MCIMX6Y2/CMSIS/Include\
	-I ../MCIMX6Y2/drivers

all: start.o led.o
	arm-none-eabi-ld -Tled.lds  $^ -o led.elf
	arm-none-eabi-objcopy -O binary -S -g led.elf led.bin
	
%.o : %.S
	arm-none-eabi-gcc -g -c $^ -o start.o
%.o : %.c
	arm-none-eabi-gcc -g $(INC) -c $^ -o led.o


.PHONY: clean
clean:
	rm *.o *.elf *.bin
##################################################################
# 指令编译器和选项
# CC=gcc
# CFLAGS=-Wall -std=gnu99
 
# # 目标文件
# TARGET=test
# SRCS = test.c \
#   ./test-add/test-add.c \
#   ./test-sub/test-sub.c
 
# INC = -I./test-add -I./test-sub
 
# OBJS = $(SRCS:.c=.o)
 
# $(TARGET):$(OBJS)
# #	@echo TARGET:$@
# #	@echo OBJECTS:$^
# [tab]$(CC) -o $@ $^
 
# clean:
# [tab]rm -rf $(TARGET) $(OBJS)
 
# %.o:%.c
# [tab]$(CC) $(CFLAGS) $(INC) -o $@ -c $<

