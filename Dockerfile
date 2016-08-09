FROM busybox
MAINTAINER Necrose99
#ENV ARCH=arm64
ADD https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build.sh /build.sh
RUN /build.sh
#
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw, /:rw

#Umeq is an equivalent of Qemu user mode. 
#It allows you to run foreign architecture binaries on your host system. 
#For example you can run arm64 binaries on x86_64 linux desktop.
# Say hello
RUN ./proot-start.sh
RUN  ./proot -R / -q ./umeq bash
RUN echo "Bootstrapped gentoo Arm64  into /:"
RUN unmae -a
RUN ls --color -lah
RUN rmdir /usr/portage/packages && ln -s /packages /usr/portage/packages 
# less digging latter if pushing packages out of docker to Binhost. 
#make easy 4 laterz with lazy sym-links.
RUN ln -s /proot-start.sh /proot-start 
RUN ln -s /umeq-arm64 /umeq  
RUN ln -s /proot-x86_64 /proot
