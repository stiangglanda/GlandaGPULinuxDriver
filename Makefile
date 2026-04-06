obj-m += glandagpu.o

# Wir erzwingen ARMv7-A für Compiler UND Assembler
# -march=armv7-a: Für den C-Compiler
# -Wa,-march=armv7-a: Reicht den Befehl direkt an den Assembler weiter
# -marm: Verhindert den Wechsel in den Thumb-Modus
ccflags-y := -march=armv7-a -marm -Wa,-march=armv7-a -fno-pic -fno-pie -Wno-error

PWD := $(shell pwd)
KDIR ?= $(abspath $(PWD)/../linux-socfpga)
CROSS := arm-linux-gnueabihf-

all:
	$(MAKE) -C $(KDIR) M=$(PWD) ARCH=arm CROSS_COMPILE=$(CROSS) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean