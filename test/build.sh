# First param is package tarball, 2nd is the *.DIGEST file
VerifyShaOfStage3()
{
	test_sum=$(awk -v myvar="$1" '$2==myvar {for(i=1; i<=1; i++) { print $1; exit}}' $2)
	calculated_sum=$(sha512sum $1 | awk '{print $1}' -)
	if [[ "$test_sum" == "$calculated_sum" ]]; then
		return 0
	else
		return 1
	fi
}

#suffix=$3 # e.g. -hardened ### arm64
# arch=$1
## Force ARCH to ARM64 Stage3 
suffix=arm64
arch=arm
# http://distfiles.gentoo.org/releases/arm/autobuilds/latest-stage3-arm64.txt
# may require some manual hackage. 
dist="http://distfiles.gentoo.org/releases/${arch}/autobuilds/"
stage3path="$(wget -q -O- ${dist}/latest-stage3-${arch}${suffix}.txt | tail -n 1 | cut -f 1 -d ' ')"
stage3="$(basename ${stage3path})"

## Get ARM-64 Emulator. 
echo "Downloading proot & umeq (Debian Developer's Qemu-static) for arm64"  
wget -q -c "${dist}/${stage3path}" "${dist}/${stage3path}.DIGESTS"

# Create working directory, keep a copy of busybox handy
mkdir newWorldOrder; cd newWorldOrder
cp /bin/busybox .

echo "Downloading and extracting ${stage3path}..."
wget -q -c "${dist}/${stage3path}" "${dist}/${stage3path}.DIGESTS"
if VerifyShaOfStage3 $stage3 "${stage3}.DIGESTS"; then
	echo "DIGEST sum is okey";
else
	echo "DIGEST sum is NOT okey";
	return 1;
fi
bunzip2 -c ${stage3} | tar --exclude "./etc/hosts" --exclude "./sys/*" -xf -
/newWorldOrder/busybox rm -f $stage3

echo "Installing stage 3 & Prep"
# Setup the rc_sys , moved from dockerfile , since going to have to wrap via emulator... less likely to fail... 
sed -e 's/#rc_sys=""/rc_sys="docker"/g' -i /newWorldOrder/etc/rc.conf
# By default, UTC system
echo 'UTC' > /newWorldOrder/etc/timezone

wget  https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/proot-start.sh -O /newWorldOrder/proot-start.sh
wget https://raw.githubusercontent.com/mickael-guene/proot-static-build/master-umeq/static/proot-x86_64 -O /newWorldOrder/proot
wget  https://github.com/mickael-guene/umeq/releases/download/1.7.4/umeq-arm64 -O /newWorldOrder/umeq
wget https://raw.githubusercontent.com/necrose99/Docker-Gentoo-ARM64/master/build/resolv.conf -O /newWorldOrder/etc/resolv.conf
chmod +x {/newWorldOrder/proot-start.sh, /newWorldOrder/umeq, /newWorldOrder/proot}
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

