FROM busybox
MAINTAINER Necrose99 necrose99@protonmail.net

VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /usr/portage/distfiles:rw

MAINTAINER Gentoo Docker Team

# This one should be present by running the build.sh script
ADD build.sh /

RUN /build.sh

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /etc/rc.conf

# By default, UTC system
RUN echo 'UTC' > /etc/timezone
