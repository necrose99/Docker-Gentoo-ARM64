From scratch
ENV ARCH=amd64
MAINTAINER Necrose99
VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw
RUN mkdir {/packages,/usr/portage,/usr/portage/distfiles} && ln -s /packages /usr/portage/packages
# less digging latter if pushing packages out of docker to Binhost. 
ADD http://distfiles.gentoo.org/releases/snapshots/current/portage-20160731.tar.bz2 /usr/portage
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build/resolv.conf /etc/resolv.conf 
ADD  https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 /umeq-arm64
RUN ln -s /umeq-arm64 /umeq
#Umeq is an equivalent of Qemu user mode. 
#It allows you to run foreign architecture binaries on your host system. 
#For example you can run arm64 binaries on x86_64 linux desktop.
ADD https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64 /proot-x86_64
RUN ln -s /proot-x86_64 /proot
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/proot-start.sh /proot-start.sh
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/tidyup.sh
docker run --privileged  ./proot-start
ENV ARCH=arm64
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /
RUN ln -s /proot-start.sh /proot-start
RUN ./tidyup.sh ## Cleaning tarballs out and tidyup.sh


