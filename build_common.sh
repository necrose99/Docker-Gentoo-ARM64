#!/bin/bash -ex

VERSION=$1
if [[ -z "$VERSION" ]]; then
    VERSION="sid"
else
    echo $VERSION
fi

function cleanup() {
    rm -Rf $TMPDIR
}

function build_configure_guest() {
mkdir -p ${TMPDIR}/scripts
chmod +x ${TMPDIR}/scripts/configure_guest.sh
}

#get script location
SCRIPTDIR=`dirname $0`
SCRIPTDIR=`(cd $SCRIPTDIR ; pwd)`

#create tmp dir
TMPDIR=`mktemp -d -t gentoo-arm64_docker_XXXXXXXX`
trap cleanup EXIT
cd ${TMPDIR}

#get umeq
mkdir -p ${TMPDIR}/tools
wget https://raw.githubusercontent.com/mickael-guene/umeq-static-build/master/bin/umeq-arm64 -O ${TMPDIR}/tools/umeq-arm64
chmod +x ${TMPDIR}/tools/umeq-arm64

#get arm64
wget http://gentoo.osuosl.org/experimental/arm/arm64/stage3-arm64-20160324.tar.bz2

#configure it
build_configure_guest
cp ${TMPDIR}/tools/umeq-arm64 ${TMPDIR}/rootfs/usr/bin/umeq-arm64
ln -rsf ${TMPDIR}/rootfs/usr/bin/umeq-arm64 ${TMPDIR}/rootfs/usr/bin/qemu-aarch64-static
tar --owner=root --group=root -c -C rootfs . | docker import - tmp_before_configuration
ID=`docker run -d -v ${TMPDIR}/scripts:/tmp/scripts tmp_before_configuration /tmp/scripts/configure_guest.sh`
docker wait $ID
docker commit $ID mickaelguene/arm64-debian:${VERSION}
docker rm $ID
docker rmi tmp_before_configuration

