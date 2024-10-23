obj-m += soft_uart.o

soft_uart-objs := module.o raspberry_soft_uart.o queue.o

ccflags-y := -Wno-incompatible-pointer-types

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules
