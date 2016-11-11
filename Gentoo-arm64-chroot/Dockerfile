From gentoo/stage3-amd64
MAINTAINER Necrose99
ENV ARCH=arm64
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /chroot/packages:rw, /:rw 
VOLUME /chroot:rw /var/lib/entropy/client/packages:rw /chroot/var/lib/entropy/client/packages:rw
ADD https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 /
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/Gentoo-arm64-chroot/build.sh /
RUN ./build.sh
ADD https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64 /proot
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /chroot/
ADD https://github.com/necrose99/Arm64-Linux-prep/blob/master/prep.zip /chroot/
ADD https://raw.githubusercontent.com/Sabayon/docker-builder-amd64/master/script/depcheck /chroot/usr/local/bin/depcheck
# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
ENV HOME /root
# fire up the chroot
ENTRYPOINT ["./proot -R /chroot/ -q ./umeq-arm64 /chroot/bin/bash"]

# Setup the rc_sys
RUN  sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /chroot/etc/rc.conf




