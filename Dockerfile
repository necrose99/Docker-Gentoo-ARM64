FROM alpine:3.4

RUN apk update && apk add \
thunar \
spice-server \
qemu-gtk \
qemu-system-x86_64 \
qemu-system-aarch64 \
### Alpine Linux as Emulation Layer, 
MAINTAINER Necrose99 necrose99@protonmail.net

VOLUME /gentoo-arm64/usr/portage:rw", /gentoo-arm64/usr/portage/distfiles:rw, /gentoo-arm64/usr/portage/distfiles:rw

# This one should be present by running the build.sh script
RUN mkdir /gentoo-arm64 && cd /gentoo-arm64
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2
RUN tar xvjpf stage3-arm64*.tar.bz2 /gentoo-arm64
RUN mkdir /gentoo-arm64/etc/binfmt.d/
# Supporting crossbuilding with binfmt
RUN cat >>/gentoo-arm64/etc/binfmt.d/qemu-arm64.conf <<EOF
# AArch64 binaries.
:qemu-arm64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/qemu-arm64:OC
EOF
# Supporting crossbuilding with qemu-aarch64-binfmt (qemu-aarch64-userstatic)


# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /gentoo-arm64/etc/rc.conf

# By default, UTC system
RUN echo 'UTC' > /gentoo-arm64/etc/timezone
docker run --privileged  chroot /gentoo-arm64/ /bin/bash
echo "Bootstrapped ${stage3path} into chroot gentoo-arm64:"
ls --color -lah
