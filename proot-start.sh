# proot-start.sh  ,
echo "Arm64 from AMD-64 what sorcery is this ?
echo "fire in the hole the chroot cometh"
## do chroot and load static emulation binformat etc.. 
## for ease of use 
proot -R /opt/gentoo-arm64/ -q ./umeq-arm64 bash
#
#type in "uname -m" or unmae -a 
sorcery () {
uname -a && ls --color -lah 
echo " sorcery I tell you ?
echo "Bootstrapped  into chroot/proot  gentoo-arm64:"
emerge-webrsync 
# populate the portage volume with ebuilds etc. 
}
