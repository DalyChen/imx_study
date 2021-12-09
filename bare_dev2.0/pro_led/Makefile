TARGET		  	?= pro_led

# 手动添加源文件
SFILES := ../devices/MCIMX6Y2/gcc/startup_MCIMX6Y2.s
CFILES := main.c ../devices/MCIMX6Y2/system_MCIMX6Y2.c

SRCDIRS			:= ./ \
				   ../devices/MCIMX6Y2/gcc/ \
				   ../devices/MCIMX6Y2/

CROSS_COMPILE 	?= arm-linux-gnueabihf-
CC 				:= $(CROSS_COMPILE)gcc
LD				:= $(CROSS_COMPILE)ld
OBJCOPY 		:= $(CROSS_COMPILE)objcopy
OBJDUMP 		:= $(CROSS_COMPILE)objdump

CFLAGS += -DCPU_MCIMX6Y2CVM08
CFLAGS += -D__GNUC__
SFLAGS += -D__ATOLLIC__

INCDIRS 		:= ../devices/MCIMX6Y2/ \
				   ../CORTEXA/Include \
				   ../CMSIS/Include/ \
				   ./
INCLUDE			:= $(patsubst %, -I %, $(INCDIRS))

SFILENDIR		:= $(notdir  $(SFILES))
CFILENDIR		:= $(notdir  $(CFILES))
SOBJS			:= $(patsubst %, obj/%, $(SFILENDIR:.s=.o))
COBJS			:= $(patsubst %, obj/%, $(CFILENDIR:.c=.o))
OBJS			:= $(SOBJS) $(COBJS)

VPATH			:= $(SRCDIRS)

obj_dir := ./obj/
$(shell if [ ! -e $(obj_dir) ];then mkdir -p $(obj_dir); fi)

$(TARGET).bin : $(OBJS)
	$(LD) -TMCIMX6Y2xxx08_ram.ld -o $(TARGET).elf $^
	$(OBJCOPY) -O binary -S $(TARGET).elf $@
	$(OBJDUMP) -D -m arm $(TARGET).elf > $(TARGET).dis

$(SOBJS) : obj/%.o : %.S
	$(CC) $(SFLAGS) -fpic -Wall -mfloat-abi=hard -march=armv7-a -c -O2  $(INCLUDE) -o $@ $<

$(COBJS) : obj/%.o : %.c
	$(CC) $(CFLAGS) -fpic -Wall -mfloat-abi=hard -march=armv7-a -c -O2  $(INCLUDE) -o $@ $<

.PHONY: clean

clean:
	rm -rf $(TARGET).elf $(TARGET).dis $(TARGET).bin $(COBJS) $(SOBJS)
