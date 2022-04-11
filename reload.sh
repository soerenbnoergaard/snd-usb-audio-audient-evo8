#!/bin/bash

make -f Makefile
sudo modprobe -r snd-usb-audio
sudo modprobe -r snd-usbmidi-lib
sudo insmod usb/snd-usbmidi-lib.ko
sudo insmod usb/snd-usb-audio.ko ignore_ctl_error=1
