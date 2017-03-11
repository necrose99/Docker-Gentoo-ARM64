FROM busybox
ENV ARCH=AMD64

#http://distfiles.gentoo.org/releases/arm/autobuilds/latest-stage3-arm64.txt

MAINTAINER Necrose99
#MAINTAINER Gentoo Docker Team

# This one should be present by running the build.sh script
ADD build.sh /
## add a portage snapshot ... 
ADD http://distfiles.gentoo.org/releases/snapshots/current/portage-latest.tar.bz2 /newWorldOrder/usr/portage/

#RUN /build.sh arm arm64
# rigged build.sh hopefully 
RUN /build.sh # arm arm64

ENV ARCH=ARM64
VOLUME /var/lib/layman:rw, /usr/portage:rw", /usr/portage/distfiles:rw, /packages:rw, /:rw
VOLUME /var/lib/entropy/client/packages:rw
## moved into build.sh 



