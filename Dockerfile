FROM scratch
MAINTAINER Necrose99
ENV ARCH=arm64

## prep Gentoo /Sabayon volume spaces... 
# Define standard volumes
VOLUME ["/usr/portage", "/usr/portage/distfiles", "/usr/portage/packages", "/var/lib/entropy/client/packages"]
## overlay spaces...
VOLUME ["/var/db/repos/", "var/lib/layman", "/usr/local/portage/"]

## add binformat to host and to chroot area 
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20180711.tar.bz2 /
# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
# Set environment variables.
WORKDIR /
