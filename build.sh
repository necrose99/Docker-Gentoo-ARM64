# First param is package tarball, 2nd is the *.DIGEST file
stage3"http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2"

# Create working directory, keep a copy of busybox handy
mkdir newWorldOrder && mkdir newWorldOrder/usr &&  mkdir /newWorldOrder/usr/bin && mkdir /newWorldOrder/etc 
mkdir /newWorldOrder/etc/binfmt.d/
cd newWorldOrder
cp /bin/busybox .
cat >>/newWorldOrder/etc/binfmt.d/qemu-arm64.conf <<EOF
# AArch64 binaries.
:qemu-arm64:M::\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xb7:\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/qemu-arm64:OC
EOF
cd /newWorldOrder/usr/bin
wget -q -c https://github.com/necrose99/Docker-Gentoo-ARM64/raw/master/qemu-aarch64-binfmt
cd /newWorldOrder
echo "Downloading and extracting ${stage3path}..."
wget -q -c "{stage3}"

bunzip2 -c ${stage3} | tar --exclude "./etc/hosts" --exclude "./sys/*" -xf -
/newWorldOrder/busybox rm -f $stage3
cd /newWorldOrder
echo "Installing stage 3"
/newWorldOrder/busybox rm -rf /lib* /usr /var /bin /sbin /opt /mnt /media /root /home /run /tmp
/newWorldOrder/busybox cp -fRap lib* /
/newWorldOrder/busybox cp -fRap bin boot home media mnt opt root run sbin tmp usr var /
/newWorldOrder/busybox cp -fRap etc/* /etc/


# Cleaning
cd /
/newWorldOrder/busybox rm -rf /newWorldOrder /build.sh /linuxrc

# Say hello
echo "Bootstrapped ${stage3path} into /:"
ls --color -lah

## ----working on. 
# Supporting crossbuilding with binfmt
