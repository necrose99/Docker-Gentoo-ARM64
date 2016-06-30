FROM scratch
MAINTAINER Necrose99 necrose99@protonmail.net
ADD http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2 /
VOLUME /usr/portage:rw", /usr/portage/distfiles:rw, /usr/portage/distfiles:rw

# Supporting crossbuilding with binfmt
ADD ext/qemu-aarch64-binfmt /usr/bin/qemu-aarch64-binfmt
ADD ./qemu-arm64.conf-gen.sh
RUN /bin/bash /qemu-arm64.conf-gen.sh
RUN env-update
RUN source /etc/profile 
# Setup the (virtually) current runlevel
RUN echo "default" > /run/openrc/softlevel

# Setup the rc_sys
RUN sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /etc/rc.conf

# Setup the net.lo runlevel
RUN ln -s /etc/init.d/net.lo /run/openrc/started/net.lo

# Setup the net.eth0 runlevel
RUN ln -s /etc/init.d/net.lo /etc/init.d/net.eth0
RUN ln -s /etc/init.d/net.eth0 /run/openrc/started/net.eth0

# By default, UTC system
RUN echo 'UTC' > /etc/timezone


#add more stuff via bash. and or add provisoning stub back. 
RUN ["/bin/bash"]
CMD ["/bin/bash"]
