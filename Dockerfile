FROM scratch
MAINTAINER Necrose99 necrose99@protonmail.net
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /
VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /usr/portage/distfiles:rw
FROM busybox

MAINTAINER Gentoo Docker Team

# This one should be present by running the build.sh script
ADD build.sh /

RUN /build.sh amd64 x86_64

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /etc/rc.conf

# By default, UTC system
RUN echo 'UTC' > /etc/timezone
