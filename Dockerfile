FROM alpine:3.3

RUN apk update && apk add \
qemu-system-x86_64 \
qemu-system-aarch64 \
### Alpine Linux as Emulation Layer, 
MAINTAINER Necrose99 necrose99@protonmail.net

VOLUME /gentoo-arm64/usr/portage:rw", /gentoo-arm64/usr/portage/distfiles:rw, /gentoo-arm64/usr/portage/distfiles:rw

# This one should be present by running the build.sh script

ADD build.sh /

RUN /build.sh

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /gentoo-arm64/etc/rc.conf

# By default, UTC system
RUN echo 'UTC' > /gentoo-arm64/etc/timezone
docker run --privileged --entrypoint chroot /gentoo-arm64/ /bin/bash
