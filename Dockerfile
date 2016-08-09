FROM busybox
ENV ARCH=arm64
MAINTAINER Necrose99
VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw
ADD build.sh /
RUN /build.sh
RUN  ./proot-x86_64 -R / -q ./umeq-arm64 bash
#Umeq is an equivalent of Qemu user mode. 
#It allows you to run foreign architecture binaries on your host system. 
#For example you can run arm64 binaries on x86_64 linux desktop.
