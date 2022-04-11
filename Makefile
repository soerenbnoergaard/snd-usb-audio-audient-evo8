SRCDIR=$(PWD)/usb
KERNELDIR = /lib/modules/$(shell uname -r)/build

obj-m = snd-usb-audio.o

all:
	make -C $(KERNELDIR) M=$(SRCDIR) modules 
clean:
	make -C $(KERNELDIR) M=$(SRCDIR) clean
