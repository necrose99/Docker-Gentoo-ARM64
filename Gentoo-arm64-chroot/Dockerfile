FROM rycus86/arm64v8-alpine-qemu
#swap to qemu alpine linux as chroot host.. 
MAINTAINER Necrose99
ENV ARCH=arm64
## prep Gentoo /Sabayon volume spaces... 
# Define standard volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/usr/portage/packages", "/var/lib/entropy/client/packages"]
VOLUME ["/var/db/repos/", "var/lib/layman", "]

ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180711.tar.bz2 /chroot/

#ADD https://raw.githubusercontent.com/Sabayon/docker-builder-amd64/master/script/depcheck /chroot/usr/local/bin/depcheck
#Add portage -into chroot.
RUN mkdir -p /chroot/usr/portage/distfiles /chroot/usr/portage/metadata /chroot/usr/portage/packages 

# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
ENV HOME /root
# fire up the chroot
WORKDIR /chroot
ENTRYPOINT ["/chroot/bin/bash"]

# Setup the rc_sys , alredy done in gentoo official image , clone into chroot.
RUN  cp /etc/rc.conf/ chroot/etc/rc.conf
