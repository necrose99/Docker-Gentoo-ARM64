FROM busybox
MAINTAINER Necrose99 necrose99@protonmail.net

VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /usr/portage/distfiles:rw

# This one should be present by running the build.sh script
ADD https://github.com/necrose99/Docker-Gentoo-ARM64/raw/master/qemu-aarch64-binfmt
RUN qemu-aarch64-binfmt
ADD build.sh /

RUN /build.sh

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /etc/rc.conf

# By default, UTC system
RUN echo 'UTC' > /etc/timezone
