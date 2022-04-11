#!/bin/bash

sudo modprobe -r snd-usb-audio
sudo modprobe -r snd-usbmidi-lib
sudo modprobe snd-usbmidi-lib
sudo modprobe snd-usb-audio ignore_ctl_error=1
