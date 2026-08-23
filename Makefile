obj-m += glandagpu.o

ccflags-y := -march=armv7-a -marm -Wa,-march=armv7-a -fno-pic -fno-pie -Wno-error

PWD := $(shell pwd)
KDIR ?= $(abspath $(PWD)/../linux)
CROSS := arm-linux-gnueabihf-

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm CROSS_COMPILE=$(CROSS) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean