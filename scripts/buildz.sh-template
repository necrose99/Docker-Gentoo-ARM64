#!/bin/bash -ex

#get script location
SCRIPTDIR=`dirname $0`
SCRIPTDIR=`(cd $SCRIPTDIR ; pwd)`

VERSION=$1
if [[ -z "$VERSION" ]]; then
    for VERSION in jessie sid; do
        . ${SCRIPTDIR}/build_common.sh ${VERSION}
    done
    docker tag -f necrose99/gentoo-arm64/:latest
else
    . ${SCRIPTDIR}/build_common.sh ${VERSION}
fi
