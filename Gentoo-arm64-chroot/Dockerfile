FROM resin/aarch64-alpine
#swap to qemu alpine linux as chroot host.. 
MAINTAINER Necrose99
ENV ARCH=arm64
## prep Gentoo /Sabayon volume spaces... 
# Define standard volumes
VOLUME ["/chroot/usr/portage", "/chroot/usr/portage/distfiles", "/chroot/usr/portage/packages", "/chroot/var/lib/entropy/client/packages"]
## overlay spaces...
VOLUME ["/chroot/var/db/repos/", "/chroot/var/lib/layman", "/chroot/usr/local/portage/ , "/chroot/var/db/repos/"]
## 
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20190613.tar.bz2 /chroot/
#
## move portage to chroot as req.. from gentoo autobuild.


#ADD https://raw.githubusercontent.com/Sabayon/docker-builder-amd64/master/script/depcheck /chroot/usr/local/bin/depcheck
#Add portage -into chroot.
RUN mkdir -p /chroot/usr/portage/distfiles

# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
ENV HOME /root
# fire up the chroot
WORKDIR /chroot/
ENTRYPOINT ["chroot /chroot/bin/bash"]

