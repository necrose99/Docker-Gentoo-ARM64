FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64

## prep Gentoo /Sabayon volume spaces... 
# Define standard volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/packages","/var/cache/binpkgs" ]
## overlay spaces...
VOLUME ["/var/db/repos/", "var/lib/layman", "/var/db/repos/gentoo/" "/var/cache/distfiles"]

## add binformat to host and to chroot area 
ADD https://build.funtoo.org/1.4-release-std/arm-64bit/arm64_generic/2020-07-06/stage3-arm64_generic-1.4-release-std-2020-07-06.tar.xz



# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
WORKDIR /
