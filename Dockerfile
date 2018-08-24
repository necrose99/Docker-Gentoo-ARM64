FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64
VOLUME /var/lib/layman:rw, /usr/portage:rw, /usr/portage/distfiles:rw, /packages:rw, /:rw"
VOLUME /var/lib/entropy/client/packages:rw,/var/db/repos/"

## add binformat to host and to chroot area 
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180711.tar.bz2 /
# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.


