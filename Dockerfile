FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /
ADD https://github.com/necrose99/Arm64-Linux-prep/blob/master/prep.zip /

#ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build.sh /build.sh
#RUN /build.sh
#
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw, /:rw



