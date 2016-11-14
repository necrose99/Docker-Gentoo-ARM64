FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw, /:rw
VOLUME /var/lib/entropy/client/packages:rw
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /
ADD https://github.com/necrose99/Arm64-Linux-prep/blob/master/prep.zip /
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build/qemu-arm64.conf /etc/binfmt.d
#Add portage 
wget http://distfiles.gentoo.org/snapshots/portage-latest.tar.bz2 /
mkdir -p /usr/portage/distfiles /usr/portage/metadata /usr/portage/packages 
bunzip2 -c  /portage-latest.tar.bz2 | tar -xf - -C /usr 
rm /portage-latest.tar.bz2
# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
ENV HOME /root
# fire up the chroot
ENTRYPOINT ["./proot -R / -q ./umeq-arm64 /bin/bash"]
#ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build.sh /build.sh
#RUN /build.sh
#
# ADD https://raw.githubusercontent.com/Sabayon/docker-builder-amd64/master/script/depcheck /chroot/usr/local/bin/depcheck


