snd-usb-audio-audient-evo8
==========================

Modified version of snd-usb-audio allowing `alsamixer` to control the real-time monitoring mix.

Building and loading the module
-------------------------------

Clone the repository and run the following commands to build the modified kernel module:

    make

Now manually unload the default `snd-usb-audio` module and replace it with the modified one:

    sudo modprobe -r snd-usb-audio
    sudo modprobe -r snd-usbmidi-lib
    sudo insmod usb/snd-usbmidi-lib.ko
    sudo insmod usb/snd-usb-audio.ko ignore_ctl_error=1

Note that this only works until you reboot.

When the kernel is updated on your system, you may need to build this kernel module again:

    make clean
    make

Real-time monitoring control
----------------------------

In a terminal, run `alsamixer` and click F6 to find the EVO8 controls.

For each microphone input there is a control for each output. The routing is shown below.

![Real-time monitoring in alsamixer](https://github.com/soerenbnoergaard/snd-usb-audio-audient-evo8/blob/main/img/alsamixer_1.png?raw=true)

The following commands sets the microphone gain and monitoring to 0 %:

    amixer -q -c EVO8 sset 'Mic' 0%
    amixer -q -c EVO8 sset 'Mic 1 mix' 0%
    amixer -q -c EVO8 sset 'Mic 2 mix' 0%
    amixer -q -c EVO8 sset 'Mic 3 mix' 0%
    amixer -q -c EVO8 sset 'Mic 4 mix' 0%

DAW output routing control
--------------------------

Like above, there is also a routing from each DAW output to each physical output. The routing below shows how to separate DAW output 1-4 into the physical output 1-4.

![DAW output routing in alsamixer](https://github.com/soerenbnoergaard/snd-usb-audio-audient-evo8/blob/main/img/alsamixer_2.png?raw=true)

The following commands set up the DAW routing as shown above:

    amixer -q -c EVO8 sset 'DAW 1 mix' 100%,0%,0%,0%
    amixer -q -c EVO8 sset 'DAW 2 mix' 0%,100%,0%,0%
    amixer -q -c EVO8 sset 'DAW 3 mix' 100%,0%,0%,0%
    amixer -q -c EVO8 sset 'DAW 4 mix' 0%,100%,0%,0%

Known limitations
-----------------

As shown above, the kernel module must me loaded with the `ignore_ctl_error=1` flag - otherwise `alsamixer` will crash. The `dmesg` output shows the following message:

    cannot get ctl value: req = 0x81, wValue = 0x100, wIndex = 0x3200, type = 0

The modifications have only been tested on the EVO8 but it may be ported to the EVO4 with minor modifications.

References
----------

I have created another tool for directly adjusting the mixer control values: [evoctl](https://github.com/soerenbnoergaard/evoctl). This, however, detaches the kernel driver, and can therefore not be used while JACK is running. Have a look there to get more details about the internals of the EVO 8.
