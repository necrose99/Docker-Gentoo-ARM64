FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64
RUN echo ':aarch64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\xfc\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xf:/usr/bin/qemu-arm64-static:' > /proc/sys/fs/binfmt_misc/register
## prep Gentoo /Sabayon volume spaces... 
# Define standard volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/packages","/var/cache/binpkgs" ]
## overlay spaces...
VOLUME ["/var/db/repos/", "var/lib/layman", "/var/db/repos/gentoo/" "/var/cache/distfiles"]

## add binformat to host and to chroot area 
ADD https://build.funtoo.org/1.4-release-std/arm-64bit/arm64_generic/2020-07-06/stage3-arm64_generic-1.4-release-std-2020-07-06.tar.xz /
## add root fs funtoo. n fix
ADD https://github.com/multiarch/qemu-user-static/releases/download/v5.0.0-2/x86_64_qemu-aarch64-static.tar.gz  /usr/bin/qemu-aarch64-static
### Add EMU
ADD https://github.com/balena-io-library/armv7hf-debian-qemu/archive/master.zip / 
 ### add resin-xbuild wraps sh etc to be more stable
#
ADD https://github.com/necrose99/Docker-Gentoo-ARM64/raw/master/tools/resin-xbuild-arm64.zip /bin/
#Overwite resin-xbuild with native arm64 if amr32 not in kernel likely ship sinks..


# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
WORKDIR /
