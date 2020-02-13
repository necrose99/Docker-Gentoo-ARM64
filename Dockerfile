FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64

## prep Gentoo /Sabayon volume spaces... 
# Define standard volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/packages", "/var/lib/entropy/client/packages"]
## overlay spaces...
VOLUME ["/var/db/repos/", "var/lib/layman", "/var/db/repos/gentoo/" "/var/cache/distfiles"]

## add binformat to host and to chroot area 
ADD  http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20191124.tar.bz2 /
ADD http://distfiles.gentoo.org/snapshots/portage-latest.tar.xz /var/db/repos/gentoo/
# systemd spec.
#ADD  http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-systemd-20190428.tar.bz2 /
# stage4-arm64-minimal-20190613.tar.bz2



# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
WORKDIR /
