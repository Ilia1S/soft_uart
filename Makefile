obj-m += soft_uart.o

soft_uart-objs := module.o raspberry_soft_uart.o queue.o

ccflags-y := -Wno-incompatible-pointer-types

KDIR ?= /lib/modules/$(shell uname -r)/build

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	install -m 644 -c soft_uart.ko /lib/modules/$(shell uname -r)
	depmod
