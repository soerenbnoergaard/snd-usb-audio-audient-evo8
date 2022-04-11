snd-usb-audio-audient-evo8
==========================

**WARNING: Work in progress! Nothing is working yet!**

Modified version of snd-usb-audio to improve compatibility with the Audient EVO8.

The existing driver seems to enumerate the mixer controls incorrectly so it is not possible to adjust the real-time monitor mix.

I have created another tool for directly adjusting the mixer control values: [evoctl](https://github.com/soerenbnoergaard/evoctl). This, however, detaches the kernel driver, and can therefore not be used while JACK is running.
