FROM busybox

#http://distfiles.gentoo.org/releases/arm/autobuilds/latest-stage3-arm64.txt

MAINTAINER Necrose99
#MAINTAINER Gentoo Docker Team

# This one should be present by running the build.sh script
ADD build.sh /

RUN /build.sh arm arm64

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="docker"/g' -i /etc/rc.conf

# By default, UTC system
RUN echo 'UTC' > /etc/timezone



