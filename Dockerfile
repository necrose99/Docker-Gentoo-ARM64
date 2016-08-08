From scratch
MAINTAINER Necrose99
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build/resolv.conf /etc/resolv.conf 
ADD  https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 /umeq
#Umeq is an equivalent of Qemu user mode. 
#It allows you to run foreign architecture binaries on your host system. 
#For example you can run arm64 binaries on x86_64 linux desktop.
ADD https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64 /proot
VOLUME /gentoo-arm64/usr/portage:rw", /gentoo-arm64/usr/portage/distfiles:rw, /gentoo-arm64/usr/portage/distfiles:rw

