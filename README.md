
[![Docker Stars](https://img.shields.io/docker/stars/necrose99/Docker-Gentoo-ARM64.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/necrose99/Docker-Gentoo-ARM64.svg)][hub]
[![IRC Channel](https://img.shields.io/badge/irc-%23necrose99-blue.svg)][irc]
[![Image Size](https://img.shields.io/imagelayers/image-size/necrose99/Docker-Gentoo-ARM64/latest.svg)](https://imagelayers.io/?images=necrose99/Docker-Gentoo-ARM64:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/necrose99/Docker-Gentoo-ARM64/latest.svg)](https://imagelayers.io/?images=necrose99/Docker-Gentoo-ARM64:latest)


###Docker Base Gentoo ARM64 package
Here is my Gentoo ARM64 stage3 docker package.
###<b>FROM scratch MAINTAINER Necrose99 necrose99@protonmail.net </b>
###A & B Gentoo Arm64 curent Tarball is provided,  along with portage 
pre editied  /etc/resolv.conf 

###C:  https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 
####Umeq is an equivalent of Qemu user mode. 
It allows you to run foreign architecture binaries on your host system. 
For example you can <b> run arm64 binaries on x86_64 linux desktop.</b> so thus your regular AMD/Intel i7 can build for arm64 rather easily.

###D: ADD https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64
### E: proot startup script to initilize the chroot, a few updater/misc scripts a Self terminating clean up dockerfile/tarballs script.

 credits @mickael-guene for the proot-static & umeq-arm64 wich make this project feasible with far less hell and frustration of other means, ie QEMU static , arm64 binformat etc. 
 ## useage use the built in scripts for cloud or ie <b>bash# ./proot-start <b>
###Emerge or equo i sys-apps/proot ( <i> if sabayon entropy</i> ) and qemu  or else host package manager deb/rpm etc. Debian you'll likely need multi-starp err see:
== https://github.com/mickael-guene/umeq/ == 
