$stage3="http://distfiles.gentoo.org/experimental/arm64/stage3-arm64-20160324.tar.bz2"
$portage="http://distfiles.gentoo.org/releases/snapshots/current/portage-20160731.tar.bz2 "

# Create working directory, keep a copy of busybox handy
mkdir {/newWorldOrder,/box,/newWorldOrder/packages,/newWorldOrder/usr/portage,/newWorldOrder/usr/portage/distfiles}; cd newWorldOrder
# Setup the rc_sys
sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /newWorldOrder/etc/rc.conf
# By default, UTC system
echo 'UTC' > /newWorldOrder/etc/timezone
cp /bin/busybox . && cp -r / /box # may need busybox to call in chroot./PROOT 
wget  https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/proot-start.sh -O /newWorldOrder/proot-start.sh
wget https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64 -O /newWorldOrder/proot
wget  https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 -O /newWorldOrder/umeq
chmod +x {/newWorldOrder/proot-start.sh, /newWorldOrder/umeq, /newWorldOrder/proot}
wget https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build/resolv.conf -O /newWorldOrder/etc/resolv.conf
#IPv4 and ipv6 googledns setup 

echo "Downloading and extracting ${stage3}.${portage}."
wget -q -c "${stage3}" "${portage}"

bunzip2 -c ${stage3} | tar --exclude "./etc/hosts" --exclude "./sys/*" -xf -
bunzip2 -c ${portage} | tar --exclude "packages"  -xf -> /usr/portage
/newWorldOrder/busybox rm -f $stage3 $portage


echo "Installing stage 3"
/newWorldOrder/busybox rm -rf /lib* /usr /var /bin /sbin /opt /mnt /media /root /home /run /tmp
/newWorldOrder/busybox cp -fRap lib* /
/newWorldOrder/busybox cp -fRap bin boot home media mnt opt root run sbin tmp usr var box packages /
/newWorldOrder/busybox cp -fRap etc/* /etc/

# Cleaning
cd /
/newWorldOrder/busybox rm -rf /newWorldOrder /build.sh /linuxrc

# Say hello
./proot-start.sh
echo "Bootstrapped ${stage3} into /:"
Run unmae -a
ls --color -lah
rmdir /usr/portage/packages && ln -s /packages /usr/portage/packages 
# less digging latter if pushing packages out of docker to Binhost. 
#make easy 4 laterz with lazy sym-links.
ln -s /proot-start.sh /proot-start 

