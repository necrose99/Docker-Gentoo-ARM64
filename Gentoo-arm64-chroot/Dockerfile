From gentoo/stage3-amd64
MAINTAINER Necrose99
ENV ARCH=arm64
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw, /:rw /chroot:rw 
ADD https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 /
ADD https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64 /proot
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /chroot/
ADD https://github.com/necrose99/Arm64-Linux-prep/blob/master/prep.zip /chroot/

RUN proot -R /chroot/ -q ./umeq-arm64 /chroot/bin/bash
#ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build.sh /build.sh
#RUN /build.sh
#

