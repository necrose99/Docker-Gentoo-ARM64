From gentoo/stage3-amd64
MAINTAINER Necrose99
ENV ARCH=arm64
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /chroot/
ADD https://github.com/necrose99/Arm64-Linux-prep/blob/master/prep.zip /chroot/
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/proot-start.sh
ln -s /proot-start.sh /proot-start
#ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build.sh /build.sh
#RUN /build.sh
#
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw, /:rw /chroot:rw 
