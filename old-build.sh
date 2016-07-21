# First param is package tarball, 2nd is the *.DIGEST file
stage3"http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2"

# Create working directory, keep a copy of busybox handy
mkdir gentoo-arm64 && mkdir gentoo-arm64/usr &&  mkdir /gentoo-arm64/usr/bin && mkdir /gentoo-arm64/etc 
mkdir /gentoo-arm64/etc/binfmt.d/
cd gentoo-arm64
cp /bin/busybox .

# Supporting crossbuilding with binfmt
cat >>/gentoo-arm64/etc/binfmt.d/qemu-arm64.conf <<EOF
# AArch64 binaries.
:qemu-arm64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/qemu-arm64:OC
EOF
cd /gentoo-arm64/usr/bin
# Supporting crossbuilding with qemu-aarch64-binfmt (qemu-aarch64-userstatic)

cd /gentoo-arm64
echo "Downloading and extracting ${stage3path}..."
wget -q -c "{stage3}"

bunzip2 -c ${stage3} | tar --exclude "./etc/hosts" --exclude "./sys/*" -xf -
/gentoo-arm64/busybox rm -f $stage3
cd /gentoo-arm64
echo "Installing stage 3"
#/newWorldOrder/busybox rm -rf /lib* /usr /var /bin /sbin /opt /mnt /media /root /home /run /tmp
#/newWorldOrder/busybox cp -fRap lib* /
#/newWorldOrder/busybox cp -fRap bin boot home media mnt opt root run sbin tmp usr var /
#  /newWorldOrder/busybox cp -fRap etc/* /etc/


# Cleaning
#cd /
#/newWorldOrder/busybox rm -rf /newWorldOrder /build.sh /linuxrc

# Say hello
echo "Bootstrapped ${stage3path} into chroot gentoo-arm64:"
ls --color -lah